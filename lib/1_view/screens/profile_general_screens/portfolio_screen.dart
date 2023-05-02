import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/protofolios_cubit/protofolio_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/app_colors.dart';
import '../../../utility/app_images.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/cv_item.dart';



class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  void initState() {
    context.read<PortfolioCubit>().getPortfolios();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocConsumer<PortfolioCubit, PortfolioState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Padding(
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
                      title: AppStrings.portfolio,
                      size: 20,
                    ),
                    const Text("             "),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                PrimaryText(
                  title: AppStrings.addPortfolioHere,
                  size: 20,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 2.h,
                ),
                DottedBorder(
                  dashPattern: [5],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  color: AppColors.primaryColor,
                  child: Container(
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffECF2FF),
                      borderRadius: BorderRadius.circular(10),

                      //border: Border.all(color:AppColors.primaryColor, width: .25,)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.secondaryColor,
                          child: ImageIcon(
                            AssetImage(AppImages.documentUpload),
                            size: 30,
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        PrimaryText(
                          title: AppStrings.uploadYourOtherFile,
                          size: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        PrimaryText(
                          title: AppStrings.maxFileSize,
                          size: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<PortfolioCubit>().addPortfolio();
                          },
                          child: Container(
                            height: 6.h,
                            width: 85.w,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: AppColors.primaryColor,)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  AssetImage(AppImages.addFileIcon),
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                PrimaryText(
                                  title: AppStrings.addFile,
                                  size: 16,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),

                SizedBox(
                  height: 47.h,
                  child: ListView.separated(itemBuilder: (context, index) =>CvItem(fileName:context.read<PortfolioCubit>().portfolioModel.dataList[index].name.toString() ,) ,
                      separatorBuilder: (context, index) => SizedBox(height: 3.h,),
                      itemCount: context.read<PortfolioCubit>().portfolioModel.dataList.length),
                )


              ],
            ),
          );
        },
      ),
    );
  }
}
