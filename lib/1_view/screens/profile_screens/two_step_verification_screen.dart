import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/app_images.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/main_button.dart';
import '../../widgets/primary_text.dart';

class TwoStepVerificationScreen extends StatefulWidget {
   const TwoStepVerificationScreen({Key? key}) : super(key: key);

  @override
  State<TwoStepVerificationScreen> createState() => _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState extends State<TwoStepVerificationScreen> {
bool value1=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_outlined)),
                PrimaryText(
                  title: AppStrings.twoStepVerification,
                  size: 20,
                ),
                const Text("             "),
              ],
            ),
            SizedBox(height: 3.h,),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xffD1D1D1))
                    ),
                    child: Row(
                      children: [
                        Expanded(child: PrimaryText(title: AppStrings.secureYourAccount, size: 16,color: AppColors.neutral500,fontWeight: FontWeight.w500,)),
                        FlutterSwitch(
                          height: 5.h,
                          activeColor: AppColors.primaryColor,
                          inactiveColor: const Color(0xffD1D5DB),
                          value:value1,
                          onToggle: (bool value) {
                            setState(() {
                              value1 = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h,),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xffD6E4FF),
                        child: ImageIcon(AssetImage(AppImages.passwordIcon,),color:const Color(0xff3366FF),),
                      ),
                      SizedBox(width: 2.w,),
                      PrimaryText(title: AppStrings.providesAdditional, size: 14,fontWeight: FontWeight.w400,color: AppColors.neutral500,)
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xffD6E4FF),
                        child: ImageIcon(AssetImage(AppImages.passwordIcon,),color:const Color(0xff3366FF),),
                      ),
                      SizedBox(width: 2.w,),
                      PrimaryText(title: AppStrings.providesAdditional, size: 14,fontWeight: FontWeight.w400,color: AppColors.neutral500,)
                    ],
                  ),

                  SizedBox(height: 46.h,),
                  MainButton(
                    textColor: Colors.white,
                    textSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.twoStepVerification2);
                    },
                    title: AppStrings.next,
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
