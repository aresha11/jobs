import 'package:amitproject/0_model/apply_job_model.dart';
import 'package:amitproject/1_view/widgets/applied_screen_item.dart';
import 'package:amitproject/2_controller/apply_job_cubit/apply_job_cubit.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_strings.dart';
import '../widgets/primary_text.dart';

class AppliedScreen extends StatefulWidget {
  const AppliedScreen({Key? key}) : super(key: key);

  @override
  State<AppliedScreen> createState() => _AppliedScreenState();
}

class _AppliedScreenState extends State<AppliedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //context.read<ApplyJobCubit>().addToApplyScreen();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ApplyJobCubit, ApplyJobState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 4.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.arrow_back_outlined)),
              PrimaryText(
                title: AppStrings.appliedJob,
                size: 20,
              ),
              const Text("             "),
            ],
          ),
          SizedBox(height: 2.h,),
          Container(
            width: double.infinity,
            height: 6.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 2.w),
            color: AppColors.neutral200,
            child: PrimaryText(title: "${ApplyJobModel.data.length.toString()} ${AppStrings.job}",size: 12.sp,color:AppColors.neutral500 ,fontWeight:FontWeight.w500 ),
          ),

          ApplyJobModel.data.isNotEmpty?
          SizedBox(height: 72.h,
          child: ListView.builder(
            itemCount:ApplyJobModel.data.length ,
              itemBuilder: (context, index) => AppliedScreenItem(index: index),)
            ):

             const Center(child: Text("NoData"))
        ],
      )
    );
  },
);
  }
}
