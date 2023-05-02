import 'package:amitproject/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../../utility/app_strings.dart';
import '../../../utility/routes.dart';
import '../../widgets/main_button.dart';
import '../../widgets/primary_text.dart';

class TwoStepVerificationScreen4 extends StatefulWidget {
  const TwoStepVerificationScreen4({Key? key}) : super(key: key);

  @override
  State<TwoStepVerificationScreen4> createState() => _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState extends State<TwoStepVerificationScreen4> {
  bool value1=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 PrimaryText(title: AppStrings.enterTheDigitCode, size: 16,fontWeight: FontWeight.w500,),
                 SizedBox(height: 1.h,),
                 PrimaryText(title: AppStrings.pleaseConfirmYourAccountByEntering, size: 15,fontWeight: FontWeight.w400,color: AppColors.neutral500,),
                 SizedBox(height: 2.h,),

                 VerificationCode(
                   margin: EdgeInsets.only(left: .5.w),
                   digitsOnly: true,
                   fullBorder: true,
                   textStyle: const TextStyle(fontSize: 20.0, color: AppColors.blackColor),
                   keyboardType: TextInputType.number,
                   underlineColor: Colors.amber, // If this is null it will use primaryColor: Colors.red from Theme
                   length: 6,
                   cursorColor: Colors.blue, // If this is null it will default to the ambient
                   // clearAll is NOT required, you can delete it
                   // takes any widget, so you can implement your design
                   clearAll: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(
                       'clear all',
                       style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline, color: Colors.blue[700]),
                     ),
                   ),
                   onCompleted: (String value) {
                     setState(() {

                     });
                   },
                   onEditing: (bool value) {
                     setState(() {

                     });
                   },
                 ),
                 Row(
                   children: [
                     PrimaryText(title: AppStrings.resendCode, size: 16,fontWeight: FontWeight.w500,color: AppColors.neutral500,),
                     SizedBox(width: 1.w,),
                     Countdown(
                       seconds: 50,
                       build: (BuildContext context, double time) => PrimaryText(
                         title: time.toInt().toString(),
                         color: AppColors.primaryColor,
                         size: 16,
                       ),
                       interval: Duration(seconds: 1),
                       onFinished: () {

                       },
                     )
                   ],
                 ),
                 SizedBox(height: 51.h,),
                 MainButton(
                   textColor: Colors.white,
                   textSize: 16,
                   fontWeight: FontWeight.w600,
                   color: AppColors.primaryColor,
                   onPressed: () {
                     Navigator.pushNamed(context, AppRoutes.loginAndSecurity);
                   },
                   title: AppStrings.verify,
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
