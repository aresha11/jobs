import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../2_controller/complete_profile_cubit/complete_profile_cubit.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/complete_profile_screen_item.dart';
import '../../widgets/default_app_bar.dart';


class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

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
                  title: "Complete Profile",
                  size: 22,
                  fontWeight: FontWeight.w500,
                ),
              )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Center(
                  child: CircularPercentIndicator(
                    animation: true,
                    animationDuration: 500,
                    //widgetIndicator: Text("100%"),
                    backgroundColor: Color(0xffE5E7EB),
                    radius: 60.0,
                    lineWidth: 10.0,
                    percent: context.read<CompleteProfileCubit>().percentage,
                    center: PrimaryText(
                        title: context
                        .read<CompleteProfileCubit>()
                        .percentage == 0 ? '0%' :context
                        .read<CompleteProfileCubit>()
                        .percentage == 0.25 ?'25%':context
                        .read<CompleteProfileCubit>()
                        .percentage == 0.5 ? '50%':'100%',
                      color: AppColors.primaryColor,
                      size: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    progressColor: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                PrimaryText(
                  title: AppStrings.completed,
                  size: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 2.h,
                ),
                PrimaryText(
                  title: AppStrings.completeYourProfile,
                  size: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade500,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 2.h,),
                    itemBuilder: (context, index) =>
                        CompleteProfileScreenItem(
                          route:context.read<CompleteProfileCubit>().items[index].route ,
                          mainText:context.read<CompleteProfileCubit>().items[index].mainText ,
                          text:context.read<CompleteProfileCubit>().items[index].text ,
                          isCompleted:context.read<CompleteProfileCubit>().items[index].isCompleted ,
                        ), itemCount: context.read<CompleteProfileCubit>().items.length,),
                )

              ],
            ),
          ),
        );
      },
    );
  }
}
