import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_images.dart';
import '../../../utility/app_strings.dart';
import '../../../utility/routes.dart';


class ApplyJobDataSubmitted extends StatelessWidget {
  const ApplyJobDataSubmitted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Image.asset(
                  AppImages.dataSubmittedIcon,
                  width: 50.w,
                  height: 30.h,
                ),
                PrimaryText(
                  title: AppStrings.yourSuccessfullySent,
                  size: 22,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 2.h,
                ),
                PrimaryText(
                  title: AppStrings.youWillGetMessageFromOurTeam,
                  size: 16,
                  fontWeight: FontWeight.w300,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context,  AppRoutes.homeLayoutRoute, (route) => false);
                },
                title: AppStrings.backHome,
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
  }
}
