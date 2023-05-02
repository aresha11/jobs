import 'package:amitproject/0_model/recent_jobs_model.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/home_cubit/home_cubit.dart';
import 'package:amitproject/2_controller/saved_cubit/saved_cubit.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_colors.dart';


class RecentJobItem extends StatefulWidget {
  RecentJobItem({Key? key,
    // required this.img,
    required this.name,
    required this.location,
    required this.salary,
    required this.compName,
    required this.jobTimeType,
    required this.jobType,
    required this.jobSkill,
    required this.id,
    required this.index,
    required this.savedImage
  })
      : super(key: key);

  // String img;
  String salary;
  String name;
  String location;
  String compName;
  String jobTimeType;
  String jobType;
  String jobSkill;
  String id;
  int index;
  String savedImage;


  @override
  State<RecentJobItem> createState() => _RecentJobItemState();
}

class _RecentJobItemState extends State<RecentJobItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavedCubit, SavedState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 14.h,
          color: Colors.transparent,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      "assets/profile.png",
                    ),
                  ),
                  SizedBox(
                    width: 3.h,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PrimaryText(
                          title: widget.name,
                          color: AppColors.neutralBlack,
                          fontWeight: FontWeight.w500,
                          size: 18,
                        ),
                        PrimaryText(
                          title: '${widget.compName}• ${widget.location}',
                          color: AppColors.neutralBlack,
                          fontWeight: FontWeight.w400,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 9.h,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<SavedCubit>().changeSavedIcon(index: widget.index);
                      setState(() {

                      });
                       context.read<SavedCubit>().addSavedJob(comp_id: RecentJobsModel.data[widget.index].id.toString());
                      // context.read<SavedCubit>().getAllSavedJobs();

                    },
                    child: ImageIcon(
                      AssetImage(
                         widget.savedImage
                      ),
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 4.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondaryColor),
                    child: PrimaryText(
                      title: widget.jobTimeType,
                      color: AppColors.neutralBlack,
                      size: 12,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 4.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondaryColor),
                    child: PrimaryText(
                      title: widget.jobType.toString(),
                      color: AppColors.neutralBlack,
                      size: 12,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 4.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.secondaryColor),
                    child: PrimaryText(
                      title: widget.jobSkill.toString(),
                      color: AppColors.neutralBlack,
                      size: 12,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Row(
                    children: [
                      PrimaryText(
                        title: '\$${widget.salary.toString()}',
                        color: AppColors.greenColor,
                        size: 16,
                      ),
                      PrimaryText(
                        title: '/Month',
                        color: AppColors.neutralBlack,
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),


        );
      },
    );
  }
}
