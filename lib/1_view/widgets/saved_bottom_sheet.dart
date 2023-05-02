import 'package:amitproject/0_model/saved_jobs_model.dart';
import 'package:amitproject/1_view/screens/apply_job_screens/apply_job_bio_data.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/2_controller/saved_cubit/saved_cubit.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_images.dart';

class SavedBottomSheet extends StatelessWidget {
   SavedBottomSheet({Key? key,required this.id,required this.index}) : super(key: key);

   dynamic id;
   int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 2.h,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ApplyJobBioDataScreen(index:index ,jobId: SavedJobs.data![index].jobId),));
              SharedPreference.put(key: "getFrom", value: "saved");
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.neutral300)
              ),
              child: Row(
                children: [
                  ImageIcon(AssetImage(AppImages.apply)),
                  SizedBox(width:2.w),
                  Expanded(child: PrimaryText(title: AppStrings.applyJop,size: 16,fontWeight: FontWeight.w500,)),
                  ImageIcon(AssetImage(AppImages.arrowRight))
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h,) ,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.neutral300)
            ),
            child: Row(
              children: [
                ImageIcon(AssetImage(AppImages.shareVia)),
                SizedBox(width:2.w),
                Expanded(child: PrimaryText(title: AppStrings.shareVia,size: 16,fontWeight: FontWeight.w500,)),
                ImageIcon(AssetImage(AppImages.arrowRight))
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          InkWell(
            onTap: (){
               context.read<SavedCubit>().deleteSavedJobs(id);
               Navigator.pop(context);
               context.read<SavedCubit>().getAllSavedJobs();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.neutral300)
              ),
              child: Row(
                children: [
                  ImageIcon(AssetImage(AppImages.archiveWhite)),
                  SizedBox(width:2.w),
                  Expanded(child: PrimaryText(title: AppStrings.cancelSave,size: 16,fontWeight: FontWeight.w500,)),
                  ImageIcon(AssetImage(AppImages.arrowRight))
                ],
              ),
            ),
          ),
          SizedBox(height: 1.h,)
        ],
      ),
    );
  }
}
