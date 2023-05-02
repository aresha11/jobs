import 'package:amitproject/0_model/suggested_jobs_model.dart';
import 'package:amitproject/1_view/screens/apply_job_screens/job_detail.dart';
import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_colors.dart';
import '../../utility/app_strings.dart';


class SuggestedItem extends StatelessWidget {
   SuggestedItem({Key? key,required this.index}) : super(key: key);

  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(16),
          height: 30.h,
          width: 85.w,
          decoration: BoxDecoration(
              color: (index == 0)
                  ? AppColors.primaryColorDark
                  : const Color(0xffF4F4F5),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                     AppImages.profile,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PrimaryText(
                          title: SuggestedJobsModel.data[index].name.toString(),
                          color: (index == 0)?
                          Colors.white:AppColors.neutralBlack,
                          fontWeight: FontWeight.w500,
                          size: 18,
                        ),
                        PrimaryText(
                          title: '${SuggestedJobsModel.data[index].compName.toString()} • ${SuggestedJobsModel.data[index].location.toString()}',
                          color: (index == 0)?
                          Colors.white:AppColors.neutralBlack,
                          fontWeight: FontWeight.w400,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 7.h,
                  ),
                  ImageIcon(
                    AssetImage(
                      AppImages.archiveWhite,
                    ),
                    size: 30,
                    color: (index == 0)?Colors.white:Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 4.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:(index == 0)
                            ? Colors.white.withOpacity(0.14):AppColors.secondaryColor),
                    child: PrimaryText(
                      title: SuggestedJobsModel.data[index].jobTimeType.toString(),
                      color: (index == 0)?
                      Colors.white:AppColors.neutralBlack,
                      size: 12,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 4.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (index == 0)
                            ? Colors.white.withOpacity(0.14):AppColors.secondaryColor),
                    child: PrimaryText(
                      title: SuggestedJobsModel.data[index].jobType.toString(),
                       color: (index == 0)?
                       Colors.white:AppColors.neutralBlack,
                      size: 12,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 4.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (index == 0)
                            ? Colors.white.withOpacity(0.14):AppColors.secondaryColor),
                    child: PrimaryText(
                      title: SuggestedJobsModel.data[index].jobSkill.toString(),
                      color: (index == 0)?
                      Colors.white:AppColors.neutralBlack,
                      size: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PrimaryText(
                    title: "\$${SuggestedJobsModel.data[index].salary.toString()}",
                     color: (index == 0)?
                     Colors.white:AppColors.neutralBlack,
                    size: 20,
                  ),
                  PrimaryText(
                    title: '/Month',
                     color: (index == 0)?
                     Colors.white:AppColors.neutralBlack,
                    size: 15,
                  ),
                  SizedBox(
                    width: 17.w,
                  ),
                  SizedBox(
                    width: 25.w,
                    height: 4.h,
                    child: MainButton(
                      onPressed: () {
                        SharedPreference.put(key: "getFrom", value: "suggested");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetails(index: index),));
                      },
                      title: AppStrings.applyNow,
                      color: AppColors.primaryColor,
                      textColor:(index == 0)?
                      Colors.white:AppColors.neutralBlack,
                    ),
                  )
                ],
              )
            ],
          ),
        );

  }
}
