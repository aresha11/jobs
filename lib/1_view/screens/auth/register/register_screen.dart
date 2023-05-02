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

import '../../../../2_controller/auth/register/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var usernameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RegisterCubit>();
    return BlocConsumer<RegisterCubit, RegisterState>(
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
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.createAccount),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            AppStrings.pleaseCreateAnAccountToFindYourDreamJob),
                        SizedBox(
                          height: 6.h,
                        ),
                        InputField(
                          onFieldSubmitted: (){},
                          onEditingComplete: () {},
                          onchange: (value) {
                            cubit.checkField(value.trim(), "first");
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
                          onFieldSubmitted: (){},
                          onEditingComplete: () {},
                          onchange: (value) {
                            cubit.checkField(value.trim(), "second");
                          },
                          controller: emailController,
                          validated: (String value) {
                            if (value.trim().isEmpty) {
                              return 'inValid';
                            } else {
                              return null;
                            }
                          },
                          hint: AppStrings.email,
                          prefixIcon: Icon(Icons.email_outlined),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        InputField(
                          onFieldSubmitted: (){},
                          onEditingComplete: () {},
                          onchange: (value) {
                            cubit.checkPasswordField(value);
                            cubit.checkField(value.trim(), "third");
                          },
                          controller: passwordController,
                          maxLines: 1,
                          validated: (String value) {
                            if (value.trim().isEmpty) {
                              return null;
                            } else {
                              return null;
                            }
                          },
                          hint: AppStrings.password,
                          prefixIcon: Icon(Icons.shopping_bag_outlined),
                          keyboardType: TextInputType.text,
                          secure: true,
                          suffixIcon: Icons.remove_red_eye,
                        ),
                        Text(
                          AppStrings.passwordMustBeAtLeast8Characters,
                          style: TextStyle(
                            color: cubit.passwordState == "initial"
                                ? AppColors.secondaryButtonColor
                                : cubit.passwordState == "notAccepted"
                                    ? Colors.red
                                    : Colors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.alreadyHaveAnAccount),
                            ButtonText(
                                onPress: () {
                                  Navigator.pop(context);
                                },
                                title: AppStrings.login),
                          ],
                        ),
                        MainButton(
                          color: cubit.first == true &&
                                  cubit.second == true &&
                                  cubit.third == true
                              ? AppColors.primaryColor
                              : AppColors.secondaryButtonColor,
                          title: AppStrings.createAccount,
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                            }
                            context.read<RegisterCubit>().
                            registerFunction(
                                password: passwordController.text,
                                email: emailController.text,
                                name: usernameController.text,
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
                              onPressed: () {
                                // cubit.registerByGoogle(context: context);
                              },
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
