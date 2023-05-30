import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/1_view/widgets/text_button.dart';
import 'package:amitproject/2_controller/database/local/recent_searched/recent_searched_cubit.dart';
import 'package:amitproject/2_controller/search_cubit/search_cubit.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_colors.dart';

class BottomSheetSetFilter extends StatelessWidget {
  const BottomSheetSetFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController=TextEditingController();
    var locationController=TextEditingController();
    var salaryController=TextEditingController();
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h,),
              Row(
                children: [
                   IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back)),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PrimaryText(
                    title: "SetFilter",
                    size: 20,
                    fontWeight: FontWeight.w500,
                  ),
                        ],
                      )),
                  ButtonText(
                    title: "Reset",
                    onPress: () {
                      nameController.text="";
                      locationController.text="";
                      salaryController.text="";

                    },
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              PrimaryText(
                title: "Job Title",
                size: 16,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 1.h,
              ),
              InputField(
                onFieldSubmitted: (){},
                controller: nameController,
                validated: (Value) {
                  // if (Value.trim().isEmpty) {
                  //   return 'inValid';
                  // } else {
                  //   return null;
                  // }
                },
                onchange: (value) {},
                onEditingComplete: () {},
                maxLines: 1,
                prefixIcon: ImageIcon(AssetImage(AppImages.jobName)),
              ),
              SizedBox(
                height: 2.h,
              ),
              PrimaryText(
                title: "Location",
                size: 16,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 1.h,
              ),
              InputField(
                onFieldSubmitted: (){},
                controller: locationController,
                validated: (Value) {
                  // if (Value.trim().isEmpty) {
                  //   return 'inValid';
                  // } else {
                  //   return null;
                  // }
                },
                onchange: (value) {},
                onEditingComplete: () {},
                maxLines: 1,
                prefixIcon: ImageIcon(AssetImage(AppImages.location)),
              ),
              SizedBox(
                height: 2.h,
              ),
              PrimaryText(
                title: "Salary",
                size: 16,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 1.h,
              ),
              InputField(
                onFieldSubmitted: (){},
                controller: salaryController,
                validated: (Value) {
                  // if (Value.trim().isEmpty) {
                  //   return 'inValid';
                  // } else {
                  //   return null;
                  // }
                },
                onchange: (value) {},
                onEditingComplete: () {},
                maxLines: 1,
                prefixIcon: ImageIcon(AssetImage(AppImages.salary)),
              ),
              SizedBox(
                height: 38.h,
              ),
              MainButton(
                color: AppColors.primaryColor,
                title: "Show result",
                textColor: Colors.white,
                textSize: 16,
                onPressed: (){
                  context.read<SearchCubit>().searchFilterJobs(nameController.text, locationController.text, salaryController.text,);
                  context.read<SearchCubit>().changeFilter();
                  context.read<RecentSearchedCubit>().insertData(title: nameController.text);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
