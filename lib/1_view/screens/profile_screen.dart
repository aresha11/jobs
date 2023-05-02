import 'package:amitproject/1_view/screens/splash_screen.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/1_view/widgets/profile_column.dart';
import 'package:amitproject/1_view/widgets/profile_row.dart';
import 'package:amitproject/1_view/widgets/secondary_text.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/2_controller/profile_cubit/profile_cubit.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:amitproject/utility/app_strings.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:dialogs/dialogs/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 34.h,
                    // width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            child: Container(
                              color: const Color(0xffD6E4FF),
                              height: 28.h,
                              width: 100.w,
                            )
                        ),
                        Positioned(
                            top: 6.h,

                            child: SizedBox(
                              width: 100.w,
                              //padding:const EdgeInsets.symmetric(horizontal: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  IconButton(onPressed: () {},
                                      icon: const Icon(
                                          Icons.arrow_back_outlined)),
                                  PrimaryText(
                                    title: AppStrings.profile, size: 20,),
                                  IconButton(onPressed: () {

                                    showAnimatedDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return ClassicGeneralDialogWidget(
                                          titleText: 'Logout',
                                          contentText: 'Are You Sure',
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 15.sp,
                                                      color:
                                                      Theme.of(context).colorScheme.primary),
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.splashScreenRoute, (route) => false);
                                                  SharedPreference.put(key: "loggedIn",value: "false");
                                                },
                                                child: Text(
                                                  "Confirm",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 15.sp,
                                                      color:
                                                      Theme.of(context).colorScheme.primary),
                                                ))
                                          ],

                                        );
                                      },
                                      animationType: DialogTransitionType.size,
                                      curve: Curves.fastOutSlowIn,
                                      duration: const Duration(seconds: 1),
                                    );
                                  },
                                      icon: ImageIcon(AssetImage(AppImages.logoutIcon),color: AppColors.redColor,)
                                  ),
                                ],
                              ),
                            )),
                         Positioned (
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(AppImages.profile),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PrimaryText(
                            title:
                                SharedPreference.get(key: "name"),
                            size: 24,
                        fontWeight: FontWeight.w500),
                        SizedBox(height: 1.h,),
                          PrimaryText(
                              title:SharedPreference.get(key: "bio"),
                              size: 14,
                            color: AppColors.neutral500,
                            fontWeight: FontWeight.w400,
                          ),

                        SizedBox(height: 2.h,),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffFAFAFA),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileColumn(
                                  title: AppStrings.applied, number: "46"),
                              const Divider(
                                height: 12,
                                color: Colors.black,
                                thickness: 8,
                              ),
                              ProfileColumn(
                                  title: AppStrings.reviewed, number: "23"),
                              const Divider(
                                color: AppColors.secondaryButtonColor,
                                thickness: 3,
                              ),
                              ProfileColumn(
                                  title: AppStrings.contacted, number: "16"),

                            ],
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SecondaryText(title: AppStrings.about, size: 22),
                            Text(AppStrings.edit, style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor),),
                          ],
                        )

////////////////////////////////abot/////////////////////////


                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 7.h,
                    color: const Color(0xffE5E7EB),
                    child: SecondaryText(title: AppStrings.general, size: 20,),
                  ),
                  SizedBox(height: 3.h,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ProfileRow(prefixIcon: Icons.person,
                            title: AppStrings.editProfile,
                            onPress: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.editProfileRoute);
                            }),
                        SizedBox(height: 2.h,),
                        const Divider(
                          thickness: 2, color: AppColors.secondaryColor,),
                        SizedBox(height: 2.h,),
                        ProfileRow(prefixIcon: Icons.photo,
                            title: AppStrings.portfolio,
                            onPress: () {}),
                        SizedBox(height: 2.h,),
                        const Divider(
                          thickness: 2, color: AppColors.secondaryColor,),
                        SizedBox(height: 2.h,),
                        ProfileRow(prefixIcon: Icons.language,
                            title: AppStrings.language,
                            onPress: () {}),
                        SizedBox(height: 2.h,),
                        const Divider(
                          thickness: 2, color: AppColors.secondaryColor,),
                        SizedBox(height: 2.h,),
                        ProfileRow(prefixIcon: Icons.notifications,
                            title: AppStrings.notification,
                            onPress: () {}),
                        SizedBox(height: 2.h,),
                        const Divider(
                          thickness: 2, color: AppColors.secondaryColor,),
                        SizedBox(height: 2.h,),
                        ProfileRow(prefixIcon: Icons.security_rounded,
                            title: AppStrings.loginAndSecurity,
                            onPress: () {
                          Navigator.pushNamed(context, AppRoutes.loginAndSecurity);
                            }),
                        SizedBox(height: 2.h,),
                        const Divider(
                          thickness: 2, color: AppColors.secondaryColor,),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 7.h,
                    color: const Color(0xffE5E7EB),
                    child: SecondaryText(title: AppStrings.others, size: 20,),
                  ),
                  SizedBox(height: 3.h,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ProfileRow(title: AppStrings.accessibility,
                          onPress: () {},
                          needSuffix: false,),
                        SizedBox(height: 1.h,),
                        const Divider(
                          thickness: 2, color: AppColors.secondaryColor,),
                        SizedBox(height: 1.h,),
                        ProfileRow(title: AppStrings.helpCenter,
                          onPress: () {
                            Navigator.pushNamed(context, AppRoutes.helpCenterRoute);
                          },
                          needSuffix: false,),
                        SizedBox(height: 1.h,),
                        const Divider(
                          thickness: 2, color: AppColors.secondaryColor,),
                        SizedBox(height: 1.h,),
                        ProfileRow(title: AppStrings.termsConditions,
                          onPress: () {
                          Navigator.pushNamed(context, AppRoutes.termsAndConditionRoute);
                          },
                          needSuffix: false,),
                        SizedBox(height: 1.h,),
                        const Divider(
                          thickness: 2, color: AppColors.secondaryColor,),
                        SizedBox(height: 1.h,),
                        ProfileRow(title: AppStrings.privacyPolicy,
                          onPress: () {
                          Navigator.pushNamed(context, AppRoutes.privacyPolicyRoute);
                          },
                          needSuffix: false,),
                        SizedBox(height: 1.h,),
                        const Divider(
                          thickness: 2, color: AppColors.secondaryColor,),
                        SizedBox(height: 1.h,),
                      ],
                    ),
                  )
                ],
              ),
            )
        );
      },
    );
  }
}
