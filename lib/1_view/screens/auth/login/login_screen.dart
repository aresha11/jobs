import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/1_view/widgets/login_register_appbar.dart';
import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/text_button.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_strings.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../2_controller/auth/login/login_cubit.dart';
import '../../../../utility/routes.dart';
import '../../../widgets/primary_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: LoginRegisterAppBar(),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                          title: AppStrings.login,
                          size: 28,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PrimaryText(
                          title: AppStrings
                              .pleaseCreateAnAccountToFindYourDreamJob,
                          size: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.neutral500,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        InputField(
                          onFieldSubmitted: () {},
                          onEditingComplete: () {},
                          onchange: (value) {
                            cubit.checkFirstField(value.trim(), "first");
                          },
                          controller: usernameController,
                          validated: (String value) {
                            if (value.trim().isEmpty) {
                              return 'inValid';
                            } else {
                              return null;
                            }
                          },
                          hint: AppStrings.username,
                          prefixIcon: Icon(Icons.person),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        InputField(
                          onEditingComplete: () {},
                          onchange: (value) {
                            cubit.checkFirstField(value.trim(), "second");
                          },
                          controller: passwordController,
                          maxLines: 1,
                          validated: (String value) {
                            if (value.trim().isEmpty) {
                              return 'inValid';
                            } else {
                              return null;
                            }
                          },
                          hint: AppStrings.password,
                          prefixIcon: Icon(Icons.shopping_bag_outlined),
                          keyboardType: TextInputType.text,
                          secure: true,
                          suffixIcon: Icons.remove_red_eye,
                          onFieldSubmitted: () {},
                        ),
                        Row(
                          children: [
                            Expanded(child: Text(AppStrings.rememberMe)),
                            ButtonText(
                              onPress: () {},
                              title: AppStrings.forgotPassword,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.doNotHaveAnAccount),
                            ButtonText(
                                onPress: () {
                                  // Navigator.of(context).popAndPushNamed(
                                  //     AppRoutes.registerScreenRoute);
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.registerScreenRoute);
                                },
                                title: AppStrings.register),
                          ],
                        ),
                        MainButton(
                          color: cubit.first == true && cubit.second == true
                              ? AppColors.primaryColor
                              : AppColors.secondaryButtonColor,
                          textColor: cubit.first == true && cubit.second == true
                              ? Colors.white
                              : AppColors.neutral500,
                          title: AppStrings.login,
                          fontWeight: FontWeight.w500,
                          textSize: 16,
                          onPressed: () {
                            cubit.postLogin(
                                email: usernameController.text,
                                password: passwordController.text,
                                context: context);

                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Stack(
                          children: [
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Center(
                              child: Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Text(AppStrings.orLoginWithAccount),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GoogleAuthButton(
                              onPressed: () {},
                              text: AppStrings.google,
                              style: const AuthButtonStyle(
                                  textStyle: TextStyle(color: Colors.black),
                                  borderWidth: 5,
                                  elevation: 0,
                                  buttonColor: Colors.transparent),
                            ),
                            FacebookAuthButton(
                              onPressed: () {},
                              text: AppStrings.facebook,
                              style: const AuthButtonStyle(
                                textStyle: TextStyle(color: Colors.black),
                                borderWidth: 5,
                                elevation: 0,
                                buttonColor: Colors.transparent,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
