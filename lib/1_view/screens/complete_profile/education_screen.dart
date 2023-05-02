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


// ignore: must_be_immutable
class EducationScreen extends StatelessWidget {
   EducationScreen({Key? key}) : super(key: key);
  var universityController = TextEditingController();
  var titleController = TextEditingController();
  var startYearController = TextEditingController();
  var endYearController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: DefaultAppBar(
            leading: const BackButton(color: AppColors.neutral500),
            centerTitle: true,
            title: PrimaryText(
              title:"Education",
              size: 22,
              fontWeight: FontWeight.w500,
            ),
          )),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 75.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400,width: .5)
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(
                      title: "University",
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InputField(
                      onchange: (V){},
                      onEditingComplete: (V){},
                      onFieldSubmitted: (I){},
                      controller: universityController,
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
                      title:"title",
                      size: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InputField(
                      onFieldSubmitted: (o){},
                      onEditingComplete: (o){},
                      onchange: (o){},
                      controller: titleController,
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
                      title: "Start Year",
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InputField(
                     onchange: (o){},
                      onEditingComplete: (o){},
                      onFieldSubmitted: (o){},
                      controller: startYearController,
                      keyboardType: TextInputType.datetime,
                      suffixIcon: Icons.calendar_month,
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
                      title: "End Year",
                      size: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InputField(
                      onFieldSubmitted: (o){},
                      onEditingComplete: (o){},
                      onchange: (o){},
                      controller: endYearController,
                      keyboardType: TextInputType.datetime,
                      suffixIcon: Icons.calendar_month,
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
                          if(formKey.currentState!.validate()){
                            context.read<CompleteProfileCubit>().addEducation(
                                universty: universityController.text,
                                title: titleController.text,
                                start: startYearController.text,
                                end: endYearController.text,
                                context: context);
                            print(universityController.text);
                            print(titleController.text);
                            print(startYearController.text);
                            print(endYearController.text);
                          }

                        },
                        title: AppStrings.save,
                        textColor: Colors.white,
                        textSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                  ],) ,
                ),
              )
            ],),
          ),
        ),
      ),
    );
  },
);
  }
}
