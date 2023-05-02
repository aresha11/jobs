import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/app_colors.dart';
import '../../../utility/app_images.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/default_app_bar.dart';

class CompletePortfolioScreen extends StatelessWidget {
  const CompletePortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: DefaultAppBar(
            leading: const BackButton(color: AppColors.neutral500),
            centerTitle: true,
            title: PrimaryText(
              title: "Portfolio Screen",
              size: 22,
              fontWeight: FontWeight.w500,
            ),
          )),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h,),
            PrimaryText(title: AppStrings.addPortfolioHere,size: 20,fontWeight: FontWeight.w500, ),
            SizedBox(height: 2.h,),
            DottedBorder(
              dashPattern: [5],
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              color: AppColors.primaryColor,
              child: Container(
                height: 25.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffECF2FF),
                  borderRadius: BorderRadius.circular(10),

                  //border: Border.all(color:AppColors.primaryColor, width: .25,)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.secondaryColor,
                      child: ImageIcon(
                        AssetImage(AppImages.documentUpload),
                        size: 30,
                      ),
                    ),
                    PrimaryText(
                      title: AppStrings.uploadYourOtherFile,
                      size: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    PrimaryText(
                      title: AppStrings.maxFileSize,
                      size: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 5.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: AppColors.primaryColor, width: .5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage(AppImages.addFileIcon),
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          PrimaryText(
                            title: AppStrings.addFile,
                            size: 16,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            Container(
              padding: EdgeInsets.all(15),
              height: 10.h,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border:
                  Border.all(color: AppColors.neutral500, width: .25)),
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //context.read<ApplyJobCubit>().pickFile();
                            },
                            child: ImageIcon(
                              AssetImage(AppImages.pdfIcon),
                              color: AppColors.redColor,
                              size: 45,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          PrimaryText(
                            title: SharedPreference.get(key: 'name') + '.CV',
                            size: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )),
                  ImageIcon(
                    AssetImage(AppImages.editIcon),
                    color: AppColors.primaryColor,
                    size: 25,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  ImageIcon(
                    AssetImage(AppImages.closeCircle),
                    color: AppColors.redColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
