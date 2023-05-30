import 'package:amitproject/0_model/apply_job_model.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_strings.dart';

class AppliedScreenItem extends StatefulWidget {
  AppliedScreenItem({Key? key, required this.index}) : super(key: key);
  int index;
  bool isClicked = false;

  @override
  State<AppliedScreenItem> createState() => _AppliedScreenItemState();
}

class _AppliedScreenItemState extends State<AppliedScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Image.asset(
                  // ApplyJobModel.data[widget.index].image.toString() == "null"
                  //     ?
                  AppImages.profile),
                      // : ApplyJobModel.data[widget.index].image.toString()),
              SizedBox(
                width: 1.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      title: ApplyJobModel.data[widget.index].name.toString(),
                      size: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    PrimaryText(
                      title:
                          "${ApplyJobModel.data[widget.index].compName.toString()} . ${ApplyJobModel.data[widget.index].location.toString()}",
                      size: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral700,
                    ),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    widget.isClicked = !widget.isClicked;
                    setState(() {});
                  },
                  child: ImageIcon(
                    AssetImage(
                       widget.isClicked==false?
                        AppImages.archiveWhite:
                        AppImages.archiveBlue
                    ),
                    color: Colors.blue,

                  )  ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: PrimaryText(
                      title: ApplyJobModel.data[widget.index].jobTimeType
                          .toString(),
                      size: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: PrimaryText(
                      title:
                          ApplyJobModel.data[widget.index].jobType.toString(),
                      size: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              )),
              PrimaryText(
                title: AppStrings.posted2DaysAgo,
                size: 10.sp,
                color: AppColors.neutral700,
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10),
            // alignment: Alignment.centerRight,
            height: 13.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.neutral200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 13.sp,
                      backgroundColor: AppColors.primaryColor,
                      child: PrimaryText(
                          title: '1', color: Colors.white, size: 16),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    PrimaryText(
                      title: AppStrings.bioData,
                      size: 9.sp,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
                // ImageIcon(AssetImage(AppAssets.submittedIcon),color: AppColors.primaryColor,size: 55),
                SizedBox(
                  width: 5.w,
                ),
                ImageIcon(AssetImage(AppImages.lineIcon),
                    size: 30, color: Colors.grey.shade400),
                SizedBox(
                  width: 1.5.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 13.sp,
                      backgroundColor: AppColors.neutral200,
                      child: CircleAvatar(
                          radius: 12.sp,
                          backgroundColor: Colors.white,
                          child: PrimaryText(
                              title: '2',
                              color: Colors.grey.shade400,
                              size: 16)),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    PrimaryText(
                      title: AppStrings.typeOfWork,
                      size: 9.sp,
                    ),
                  ],
                ),
                SizedBox(
                  width: 5.w,
                ),
                ImageIcon(AssetImage(AppImages.lineIcon),
                    size: 30, color: Colors.grey.shade400),
                SizedBox(
                  width: 1.5.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 13.sp,
                      backgroundColor: AppColors.neutral200,
                      child: CircleAvatar(
                          radius: 12.sp,
                          backgroundColor: Colors.white,
                          child: PrimaryText(
                              title: '3',
                              color: Colors.grey.shade400,
                              size: 16)),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    PrimaryText(
                      title: AppStrings.uploadPortfolio,
                      size: 9.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          const Divider(
            color: AppColors.neutral200,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
