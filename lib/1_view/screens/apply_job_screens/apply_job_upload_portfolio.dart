import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../2_controller/apply_job_cubit/apply_job_cubit.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_images.dart';
import '../../../utility/app_strings.dart';



class ApplyJobUploadPortfolio extends StatelessWidget {
  ApplyJobUploadPortfolio({
    Key? key,
    this.jobId,
    required this.name,
    required this.email,
    required this.phone,
    required this.typeOfWork,
    required this.index,
  }) : super(key: key);
  dynamic jobId;
  String name;
  String email;
  String phone;
  String typeOfWork;
  int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplyJobCubit, ApplyJobState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_outlined)),
                      PrimaryText(
                        title: AppStrings.applyJop,
                        size: 20,
                      ),
                      const Text("             "),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 26,
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          Icons.check,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      // ImageIcon(AssetImage(AppAssets.submittedIcon),color: AppColors.primaryColor,size: 55),
                      SizedBox(
                        width: 5.w,
                      ),
                      ImageIcon(AssetImage(AppImages.lineIcon),
                          size: 30, color: AppColors.primaryColor),
                      SizedBox(
                        width: 5.w,
                      ),
                      const CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 26,
                        child: CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(
                              Icons.check,
                              size: 30,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      ImageIcon(AssetImage(AppImages.lineIcon),
                          size: 30, color: AppColors.primaryColor),
                      SizedBox(
                        width: 5.w,
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 26,
                        child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: PrimaryText(
                                title: '3',
                                color: AppColors.primaryColor,
                                size: 16)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      PrimaryText(
                        title: AppStrings.bioData,
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      PrimaryText(
                        title: AppStrings.typeOfWork,
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      PrimaryText(
                        title: AppStrings.uploadPortfolio,
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  PrimaryText(
                    title: AppStrings.uploadPortfolio,
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  PrimaryText(
                    title: AppStrings.fillInYourBioDataCorrectly,
                    size: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  PrimaryText(
                    title: AppStrings.uploadCV,
                    size: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 10.h,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColors.neutral200, )),
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
                  SizedBox(
                    height: 4.h,
                  ),
                  PrimaryText(
                    title: AppStrings.otherFile,
                    size: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
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
                              AssetImage(AppImages.shareVia),
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
                ],
              ),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MainButton(
                    onPressed: () {
                      print(jobId);
                      context.read<ApplyJobCubit>().applyJob(
                        index: index,
                          context: context,
                          email: email,
                          name: name,
                          phone: phone,
                          //cv_file: 'context.read',
                          work_type: 'full',
                          other_file: 'other_file',
                          job_id: jobId.toString(),
                          user_id: SharedPreference.get(key: 'id').toString());
                    },
                    title: AppStrings.submit,
                    textColor: Colors.white,
                    textSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            ));
      },
    );
  }
}
