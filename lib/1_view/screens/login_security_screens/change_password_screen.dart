import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/2_controller/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/app_colors.dart';
import '../../../utility/app_images.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/primary_text.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({Key? key}) : super(key: key);
   var oldPasswordController = TextEditingController();
   var newPasswordController = TextEditingController();
   var confirmPasswordController = TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {



    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            child: SingleChildScrollView(
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
                        title: AppStrings.changePassword,
                        size: 20,
                      ),
                      const Text("             "),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              title: AppStrings.enterYourOldPassword,
                              size: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            InputField(
                              maxLines: 1,
                              secure: true,
                              controller: oldPasswordController,
                              validated: (String value) {
                                if(value.isEmpty){
                                  return "Password not match";
                                }else {
                                  return null;
                                }
                              },
                              onchange: (v) {},
                              onEditingComplete: () {},
                              onFieldSubmitted: () {},
                              hint: AppStrings.enterYourOldPassword,
                              prefixIcon: ImageIcon(
                                AssetImage(AppImages.passwordIcon),
                              ),
                              suffixIcon: Icons.remove_red_eye,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            PrimaryText(
                              title: AppStrings.enterYourNewPassword,
                              size: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            InputField(
                              controller: newPasswordController,
                              maxLines: 1,
                              secure: true,

                              validated: (String value) {
                                if(value.isEmpty){
                                  return "Password not match";
                                }else {
                                  return null;
                                }
                              },
                              onchange: (v) {},
                              onEditingComplete: () {},
                              onFieldSubmitted: () {},
                              hint: AppStrings.enterYourNewPassword,
                              prefixIcon: ImageIcon(
                                AssetImage(AppImages.passwordIcon),
                              ),
                              suffixIcon: Icons.remove_red_eye,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            PrimaryText(
                              title: AppStrings.confirmYourNewPassword,
                              size: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            InputField(
                              controller: confirmPasswordController,
                              maxLines: 1,
                              secure: true,
                              validated: (String value) {
                                if(value.isEmpty){
                                  return "Password not match";
                                }else {
                                  return null;
                                }
                              },
                              onchange: (v) {},
                              onEditingComplete: () {},
                              onFieldSubmitted: () {},
                              hint: AppStrings.confirmYourNewPassword,
                              prefixIcon: ImageIcon(
                                AssetImage(AppImages.passwordIcon),
                              ),
                              suffixIcon: Icons.remove_red_eye,
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            MainButton(
                              textColor: Colors.white,
                              textSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                              onPressed: () {
                                if(formKey.currentState!.validate()){
                                  context.read<ChangePasswordCubit>()
                                      .changePassword(
                                      password: confirmPasswordController.text
                                          .toString());
                                  Navigator.pop(context);
                                }
                              },
                              title: AppStrings.save,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
