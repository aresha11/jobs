import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/app_strings.dart';
import '../../widgets/login_security_row.dart';
import '../../widgets/primary_text.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>nextPage=[AppRoutes.emailAddress,AppRoutes.phoneNumberScreen,AppRoutes.changePassword,AppRoutes.twoStepVerification,AppRoutes.changePassword,];
    List<String>firstTitle=[AppStrings.emailAddress,AppStrings.phoneNumber,AppStrings.changePassword,AppStrings.twoStepVerification,AppStrings.faceID,];
    List<String>secondTitle=[SharedPreference.get(key: "${SharedPreference.get(key: "loginEmail")}"),"","","",""];
    return Scaffold(
      body: Container(
        child: Column(
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
                  title: AppStrings.loginAndSecurity,
                  size: 20,
                ),
                const Text("             "),
              ],
            ),
            SizedBox(height: 2.h,),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 5.h,
              color: AppColors.neutral200,
              width: double.infinity,
              child: PrimaryText(title:AppStrings.accountAccess ,size: 16,fontWeight:FontWeight.w500 ,color: AppColors.neutral500),
            ),
            SizedBox(height: 2.h,),
            SizedBox(
              height: 79.5.h,
              child: ListView.builder(
                itemCount: 5,
                  itemBuilder:(context, index) =>  LoginAndSecurityRow(
                    secondTitle: secondTitle[index],
                    nextPage: nextPage[index],
                    firstTitle:firstTitle[index],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
