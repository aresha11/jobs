import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/protofolios_cubit/protofolio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_colors.dart';
import '../../utility/app_images.dart';

class CvItem extends StatelessWidget {
  CvItem({Key? key, required this.fileName}) : super(key: key);
  String fileName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 11.h,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.neutral300, )),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              ImageIcon(
                AssetImage(AppImages.pdfIcon),
                color: AppColors.redColor,
                size: 45,
              ),
              SizedBox(
                width: 4.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    title: fileName + '.CV',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      PrimaryText(
                        title: 'cv.pdf 300KB',
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
                        size: 10.sp,
                      )
                    ],
                  )
                ],
              )
            ],
          )),
          ImageIcon(
            AssetImage(AppImages.editIcon),
            color: AppColors.primaryColor,
            size: 25,
          ),
          SizedBox(
            width: 2.w,
          ),
          InkWell(
            onTap: (){
              context.read<PortfolioCubit>().deletePortfolio();
            },
            child: ImageIcon(
              AssetImage(AppImages.closeCircle),
              color: AppColors.redColor,
            ),
          ),
        ],
      ),
    );
  }
}
