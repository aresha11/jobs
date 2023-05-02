import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../../../utility/app_colors.dart';
import '../../../utility/app_strings.dart';

import '../../widgets/apply_job_type_of_work_item.dart';
import 'apply_job_upload_portfolio.dart';

class ApplyJobTypeOfWork extends StatelessWidget {
   ApplyJobTypeOfWork({Key? key,this.jobId,required this.name,required this.email,required this.phone,this.typeOfWork='',required this.index}) : super(key: key);
  dynamic jobId;
  String name;
   String email;
   String phone;
   String typeOfWork;
   int index;
   List items =[
     AppStrings.seniorUXDesigner,
     AppStrings.seniorUIDesigner,
     AppStrings.graphikDesigner,
     AppStrings.frontEndDeveloper
   ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      size: 30, color: AppColors.primaryColor),
                  SizedBox(
                    width: 5.w,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 26,
                    child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: PrimaryText(
                            title: '2',
                            color: AppColors.primaryColor,
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
                            color: Colors.grey.shade400,
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
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColorDark,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  PrimaryText(
                    title: AppStrings.typeOfWork,
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColorDark,
                  ),
                  SizedBox(
                    width: 11.w,
                  ),
                  PrimaryText(
                    title: AppStrings.uploadPortfolio,
                    size: 12,
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
                    title: AppStrings.typeOfWork,
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
                  SizedBox(
                    height: 55.h,
                    child: ListView.separated(
                     // shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ApplyJobTypeOfWorkItem(text:items[index],index: index,);

                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 2.h,
                            ),
                        itemCount: items.length),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainButton(
                onPressed: () {
                  print(jobId);
                  print(typeOfWork);
                  print(name);
                  print(email);
                  print(phone);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        ApplyJobUploadPortfolio(
                          index: index,
                            jobId:jobId,
                            name:name,
                            email:email,
                            phone:phone,
                            typeOfWork: typeOfWork ),));
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
          ),
        ));
  }
}
