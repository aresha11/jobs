import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/app_colors.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/input_field.dart';
import 'apply_job_type_of_work.dart';


class ApplyJobBioDataScreen extends StatelessWidget {
  ApplyJobBioDataScreen({Key? key,required this.jobId,required this.index}) : super(key: key);
  dynamic jobId;
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
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
                        size: 30, color: Colors.grey.shade400),
                    SizedBox(
                      width: 5.w,
                    ),
                    CircleAvatar(
                      radius: 26,
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: PrimaryText(
                              title: '2',
                              color: Colors.grey.shade400,
                              size: 16)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    ImageIcon(AssetImage(AppImages.lineIcon),
                        size: 30, color: Colors.grey.shade400),
                    SizedBox(
                      width: 5.w,
                    ),
                    CircleAvatar(
                      radius: 26,
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: PrimaryText(
                              title: '3',
                              color: AppColors.neutral400,
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
                      size: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColorDark,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    PrimaryText(
                      title: AppStrings.typeOfWork,
                      size: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    PrimaryText(
                      title: AppStrings.uploadPortfolio,
                      size: 10.sp,
                      fontWeight: FontWeight.w400,

                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      title: AppStrings.bioData,
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
                      title: AppStrings.name,
                      size: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InputField(
                      onchange: (v){},
                      onEditingComplete: (){},
                      onFieldSubmitted: (){},
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      hint: AppStrings.username,
                      prefixIcon: Image.asset(AppImages.profile),
                      validated: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    PrimaryText(
                      title: AppStrings.email,
                      size: 16,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
                    InputField(
                      onchange: (v){},
                      onEditingComplete: (){},
                      onFieldSubmitted: (){},
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hint: AppStrings.email,
                      prefixIcon: Image.asset(AppImages.email),
                      validated: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required;
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                            .hasMatch(value)) {
                          return (AppStrings.validEmail);
                        } else {
                          return null;
                        }
                      },
                    ),

                    SizedBox(
                      height: 4.h,
                    ),
                    PrimaryText(
                      title: AppStrings.noHandPhone,
                      size: 16,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
                    InputField(
                      onFieldSubmitted: (){},
                      onEditingComplete: (){},
                      onchange: (v){},
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      hint: AppStrings.phoneNumber,
                      prefixIcon: CountryListPick(
                          theme: CountryTheme(
                            isShowFlag: true,
                            isShowTitle: false,
                            isShowCode: false,
                            isDownIcon: true,
                            showEnglishName: false,
                          ),
                          // Set default value
                          //initialSelection: '+20',
                          // or
                          initialSelection: 'US',
                          onChanged: (code) {
                            // print(code.name);
                            // print(code.code);

                            print(code?.dialCode);
                            // print(code.flagUri);
                          },
                          // Whether to allow the widget to set a custom UI overlay
                          useUiOverlay: false,
                          // Whether the country list should be wrapped in a SafeArea
                          useSafeArea: false),
                      validated: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MainButton(
                          onPressed: () {
                            print(jobId);
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ApplyJobTypeOfWork(
                                      index: index,
                                      jobId: jobId,
                                      name: userNameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                    ),
                                  ));
                            }
                          },
                          title: AppStrings.next,
                          textColor: Colors.white,
                          textSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 2.h,
                        )
                      ],
                    )

                    // CountryListPick(
                    //     theme: CountryTheme(
                    //       isShowFlag: true,
                    //       isShowTitle: false,
                    //       isShowCode: false,
                    //       isDownIcon: true,
                    //       showEnglishName: false,
                    //     ),
                    //     // Set default value
                    //     //initialSelection: '+20',
                    //     // or
                    //      initialSelection: 'US',
                    //     onChanged: (code) {
                    //       // print(code.name);
                    //       // print(code.code);
                    //       // print(code.dialCode);
                    //       // print(code.flagUri);
                    //     },
                    //     // Whether to allow the widget to set a custom UI overlay
                    //     useUiOverlay: false,
                    //     // Whether the country list should be wrapped in a SafeArea
                    //     useSafeArea: false
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       DefaultButton(
      //         onPressed: () {
      //           print(jobId);
      //           Navigator.push(context, MaterialPageRoute(
      //             builder: (context) =>
      //                 ApplyJobTypeOfWork(jobId: jobId,
      //                     name:userNameController.text,
      //                     email:emailController.text ,
      //                     phone:phoneController.text,
      //                 ),));
      //         },
      //         text: AppStrings.next,
      //         textColor: Colors.white,
      //         width: double.infinity,
      //         height: 7.h,
      //         fontSize: 15.sp,
      //         fontWeight: FontWeight.w500,
      //         radius: 3.5.h,
      //         background: AppColors.primaryColor,
      //       ),
      //       SizedBox(
      //         height: 2.h,
      //       )
      //     ],
      //   ),
      // )
    );
  }
}
