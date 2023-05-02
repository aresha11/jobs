import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../2_controller/complete_profile_cubit/complete_profile_cubit.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/default_app_bar.dart';

class ExperienceScreen extends StatelessWidget {
  ExperienceScreen({Key? key}) : super(key: key);
  var positionController = TextEditingController();
  var typeOfWorkController = TextEditingController();
  var companyNameController = TextEditingController();
  var locationController = TextEditingController();
  var startYearController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: DefaultAppBar(
            leading: const BackButton(color: AppColors.neutral500),
            centerTitle: true,
            title: PrimaryText(
              title: "Experience",
              size: 22,
              fontWeight: FontWeight.w500,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 85.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey.shade400, width: .5)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            title: "Position",
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InputField(
                            onchange: (O) {},
                            onEditingComplete: (O) {},
                            onFieldSubmitted: (O) {},
                            controller: positionController,
                            keyboardType: TextInputType.text,
                            validated: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.required;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          PrimaryText(
                            title: AppStrings.typeOfWork,
                            size: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InputField(
                            onchange: (O) {},
                            onEditingComplete: (O) {},
                            onFieldSubmitted: (O) {},
                            controller: typeOfWorkController,
                            keyboardType: TextInputType.text,
                            validated: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.required;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          PrimaryText(
                            title: "Company Name",
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InputField(
                            onchange: (O) {},
                            onEditingComplete: (O) {},
                            onFieldSubmitted: (O) {},
                            controller: companyNameController,
                            keyboardType: TextInputType.text,
                            validated: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.required;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          PrimaryText(
                            title: "Location",
                            size: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InputField(
                            onchange: (O) {},
                            onEditingComplete: (O) {},
                            onFieldSubmitted: (O) {},
                            controller: locationController,
                            keyboardType: TextInputType.text,
                            validated: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.required;
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: true,
                                onChanged: (bool? value) {},
                                activeColor: AppColors.primaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              PrimaryText(
                                title: "I Am Currently Working",
                                fontWeight: FontWeight.w500,
                                size: 12.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          PrimaryText(
                            title: "Start Year",
                            size: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InputField(
                            onchange: (O) {},
                            onEditingComplete: (O) {},
                            onFieldSubmitted: (O) {},
                            controller: startYearController,
                            keyboardType: TextInputType.datetime,
                            validated: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.required;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          MainButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<CompleteProfileCubit>()
                                    .addExperience(
                                        postion: positionController.text,
                                        type_work: typeOfWorkController.text,
                                        comp_name: companyNameController.text,
                                        location: locationController.text,
                                        start: startYearController.text,
                                        context: context);
                              }
                            },
                            title: AppStrings.save,
                            textColor: Colors.white,
                            textSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
