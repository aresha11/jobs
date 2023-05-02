import 'package:amitproject/0_model/search_model.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainSearchItem extends StatelessWidget {
  MainSearchItem({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: 600,
      //height: 400,
      child: Column(
        children: [
          Row(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.access_time),
              SizedBox(width: 2.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    PrimaryText(
                        title: SearchModel.data![index].name.toString(),
                        size: 20),
                    PrimaryText(
                        title:
                            "${SearchModel.data![index].compName.toString()} • ${SearchModel.data![index].location.toString()}",
                        size: 14),
                  ],
                ),
              ),
              ImageIcon(AssetImage(AppImages.archiveWhite))
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
             Container(
               width: 25.w,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.secondaryColor),
                  child: PrimaryText(
                      size: 16,
                      title: SearchModel.data![index].jobTimeType.toString(),
                      color: AppColors.primaryColor),
                ),
              SizedBox(width: 1.5.w,),
              Container(
                width: 25.w,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.secondaryColor),
                  child: PrimaryText(
                    size: 16,
                    title: SearchModel.data![index].jobType.toString(),
                    color: AppColors.primaryColor,
                  ),
                ),
              Expanded(child: SizedBox(width: 0,)),

              RichText(
                    text: TextSpan(
                        text: "\$${SearchModel.data![index].salary.toString()}",
                        style: const TextStyle(
                            color: AppColors.greenColor, fontSize: 16),
                        children: const [
                      TextSpan(
                        text: "/Moth",
                        style: TextStyle(
                            color: AppColors.neutral500, fontSize: 12),
                      ),
                    ])),

            ],
          ),
          SizedBox(
            height: 3.h,
          )
        ],
      ),
    );
  }
}
