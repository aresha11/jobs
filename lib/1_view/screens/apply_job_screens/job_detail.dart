import 'package:amitproject/0_model/suggested_jobs_model.dart';
import 'package:amitproject/1_view/screens/apply_job_screens/apply_job_bio_data.dart';
import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../2_controller/apply_job_cubit/apply_job_cubit.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_strings.dart';


class JobDetails extends StatefulWidget {
   JobDetails({Key? key,required this.index}) : super(key: key);

  int index;

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  void initState() {


    // TODO: implement initState
    context.read<ApplyJobCubit>().currentIndex=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplyJobCubit, ApplyJobState>(
  listener: (context, state) {

    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    fontWeight: FontWeight.w500,
                    title: AppStrings.jobDetail,
                    size: 18.sp,
                  ),
                  ImageIcon(AssetImage(AppImages.archiveBlue))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                  height: 7.h,
                  width: 8.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: //SuggestedJobsModel.data[widget.index].image.toString() == 'null'
                     // ?
                  ImageIcon(AssetImage(AppImages.profile))),
                     // : Image.network(SuggestedJobsModel.data[widget.index].image.toString())),
              SizedBox(
                height: 1.h,
              ),
              PrimaryText(
                title: SuggestedJobsModel.data[widget.index].name.toString(),
                size: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryText(
                    title: SuggestedJobsModel.data[widget.index].compName.toString(),
                    color:  AppColors.neutral700,
                    fontWeight: FontWeight.w400,
                    size: 10.sp,
                    maxLines: 2,
                  ),
                  SizedBox(width: .75.w,),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color:  AppColors.neutral500),
                  ),
                  SizedBox(width: .75.w,),
                  Container(
                    width: 70.w,
                    child: PrimaryText(
                      title:SuggestedJobsModel.data[widget.index].location.toString(),
                      color: AppColors.neutral700,
                      fontWeight: FontWeight.w400,
                      size: 10.sp,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 5.h,
                    width: 23.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondaryColor),
                    child: PrimaryText(
                      title: SuggestedJobsModel.data[widget.index].jobTimeType.toString(),
                      color: AppColors.primaryColor,
                      size: 12,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 5.h,
                    width: 23.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondaryColor),
                    child: PrimaryText(
                      title: SuggestedJobsModel.data[widget.index].jobType.toString(),
                      color: AppColors.primaryColor,
                      size: 12,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 5.h,
                    width: 23.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondaryColor),
                    child: PrimaryText(
                      title: SuggestedJobsModel.data[widget.index].jobSkill.toString(),
                      color: AppColors.primaryColor,
                      size: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              ToggleSwitch(
                changeOnTap: true,
                minWidth: 30.w,
                cornerRadius: 22.0,
                fontSize: 12.sp,
                minHeight: 7.h,
                activeBgColor: const [AppColors.primaryColorDark],
                //activeBgColors: [[AppColors.primaryColor], [AppColors.primaryColor]],
                activeFgColor: Colors.white,
                inactiveBgColor: const Color(0xffF4F4F5),
                inactiveFgColor: const Color(0xff6B7280),
                initialLabelIndex:
                context.read<ApplyJobCubit>().currentIndex,
                totalSwitches: 3,
                labels: [
                  AppStrings.description,
                  AppStrings.company,
                  AppStrings.people
                ],
                radiusStyle: true,
                onToggle: (index) {
                  context.read<ApplyJobCubit>().changeIndex(index);
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              ConditionalBuilder(
                builder: (context) {
                  if (context.read<ApplyJobCubit>().currentIndex == 2) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                PrimaryText(
                                  //textAlign: TextAlign.start,
                                  title: '6 Employees For',
                                  size: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                PrimaryText(
                                  color: AppColors.neutral500,
                                  //textAlign: TextAlign.start,
                                  title: 'UI/UX Design',
                                  size: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              width: 40.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                     color: AppColors.neutral300),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  PrimaryText(
                                    //textAlign: TextAlign.start,
                                    title: 'UI/UX Design',
                                    size: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 1.5.h,),
                        SizedBox(
                          height: 60.h,
                          child: ListView.separated(
                            //shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 21,
                                      backgroundImage: AssetImage('assets/Logo.png'),
                                    ),
                                    SizedBox(width: 4.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        PrimaryText(
                                          //textAlign: TextAlign.start,
                                          title: 'Dimas Adi Saputro',
                                          size: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),

                                        PrimaryText(
                                          color: AppColors.neutral500,
                                          //textAlign: TextAlign.start,
                                          title: 'Senior UI/UX Designer at Twitter',
                                          size: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 8.w,),
                                    Column(
                                      children: [
                                        PrimaryText(
                                          color: AppColors.neutral500,
                                          //textAlign: TextAlign.start,
                                          title: 'Work during',
                                          size: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        PrimaryText(
                                          //textAlign: TextAlign.start,
                                          title: '5 Years',
                                          size: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primaryColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) => const Divider(
                                thickness: .5,
                              ),
                              itemCount: 3),
                        )
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                          //textAlign: TextAlign.start,
                          title: AppStrings.contactUs,
                          size: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              height: 8.h,
                              width: 42.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.neutral200, ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  PrimaryText(
                                    //textAlign: TextAlign.start,
                                    title: AppStrings.email,
                                    size: 10.sp,
                                    color: AppColors.neutral400,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  PrimaryText(
                                    //textAlign: TextAlign.start,
                                    title: SuggestedJobsModel.data[widget.index].compEmail.toString(),
                                    size: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              height: 8.h,
                              width: 42.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.neutral200,),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  PrimaryText(
                                    //textAlign: TextAlign.start,
                                    title: AppStrings.website,
                                    size: 10.sp,
                                    color: AppColors.neutral400,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  PrimaryText(
                                    //textAlign: TextAlign.start,
                                    title: SuggestedJobsModel.data[widget.index].compWebsite.toString(),
                                    size: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        PrimaryText(
                          //textAlign: TextAlign.start,
                          title: AppStrings.aboutCompany,
                          size: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        PrimaryText(
                          title:SuggestedJobsModel.data[widget.index].aboutComp.toString(),
                          size: 10.sp,
                          color: AppColors.neutral600,
                          fontWeight: FontWeight.w400,
                          maxLines: 30,
                        ),
                      ],
                    );
                  }
                },
                condition:
                context.read<ApplyJobCubit>().currentIndex == 1 ||
                    context.read<ApplyJobCubit>().currentIndex == 2,
                fallback: (context) {
                  return Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.h,),
                        PrimaryText(
                          title: AppStrings.jobDescription,
                          size: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        PrimaryText(
                          title:SuggestedJobsModel.data[widget.index].jobDescription.toString(),
                          size: 10.sp,
                          color: AppColors.neutral600,
                          fontWeight: FontWeight.w400,
                          maxLines: 7,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        PrimaryText(
                          title: AppStrings.skillRequired,
                          size: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        PrimaryText(
                          title: SuggestedJobsModel.data[widget.index].name.toString(),
                          size: 10.sp,
                          color: AppColors.neutral600,
                          fontWeight: FontWeight.w400,
                          maxLines: 30,
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainButton(
              onPressed: () {
                // print(context.read<ApplyJobCubit>().jobDetailsModel.id);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ApplyJobBioDataScreen(jobId: context.read<ApplyJobCubit>().jobDetailsModel.id.toString()),));

               // Navigator.pushNamed(context, AppRoutes.applyJobBioDataScreenRoute);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ApplyJobBioDataScreen(
                        jobId: SuggestedJobsModel.data[widget.index].id.toString(),
                      index: widget.index,
                    )),
                );
              },
              title: AppStrings.applyNow,
              textColor: Colors.white,
              textSize: 15.sp,
              fontWeight: FontWeight.w500,
              //radius: 3.5.h,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  },
);
  }
}
