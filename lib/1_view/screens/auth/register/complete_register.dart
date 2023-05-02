import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/1_view/widgets/secondary_text.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utility/app_colors.dart';
import '../../../../utility/app_images.dart';
import '../../../../utility/app_strings.dart';

class CompleteRegister extends StatelessWidget {
  const CompleteRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 14.h,
              ),
              Image.asset(AppImages.registerSuccess),
              SizedBox(
                height: 5.h,
              ),
              PrimaryText(
                title: AppStrings.setUp,
                size: 24,
              ),
              SizedBox(
                height: 3.h,
              ),
              SecondaryText(
                title: AppStrings.customized,
                size: 14,
              ),
              SizedBox(
                height: 40.h,
              ),
              MainButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.homeLayoutRoute, (route) => false);
                },
                title: AppStrings.getStarted,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
