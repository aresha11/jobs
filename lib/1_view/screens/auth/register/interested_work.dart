import 'package:amitproject/1_view/widgets/interested_work_container.dart';
import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/1_view/widgets/secondary_text.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utility/app_images.dart';
import '../../../../utility/routes.dart';

class InterestedWork extends StatefulWidget {
  const InterestedWork({Key? key}) : super(key: key);

  @override
  State<InterestedWork> createState() => _InterestedWorkState();
}

class _InterestedWorkState extends State<InterestedWork> {
  List interestedWorkText=["UI/UX Designer","Illustrator Designer","Developer","Management","Information Technology","Research and Analytics"];
  List interestedWorkIcons=[AppImages.uiDesigner,AppImages.illustratorCategory,AppImages.developerCategory,AppImages.managementCategory,AppImages.informationCategory,AppImages.researchCategory,];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding:const EdgeInsets.symmetric(horizontal: 20),
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h,),
              PrimaryText(title:AppStrings.whatTypeOfWorkAreYouInterestedIn , size: 24,maxLines: 2,),
              SizedBox(height: 1.5.h,),
              SecondaryText(title: AppStrings.tellUsWhatYouInterestedIn, size: 16),
               GridView.builder(
                 shrinkWrap: true,
                  itemCount:6 ,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,mainAxisExtent: 130,crossAxisSpacing: 10,mainAxisSpacing: 15,childAspectRatio: 20),

                //  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                    return  InterestedWorkContainer(
                      title: interestedWorkText[index],
                      imageIcon: interestedWorkIcons[index],
                    );
                },
              ),
              SizedBox(height: 5.h,),
              MainButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.preferredLocationRoute);

                },
                color: AppColors.primaryColor,
                title: AppStrings.next,
                textSize: 12.sp,
                fontWeight: FontWeight.w500,
                textColor: Colors.white,
              )

             ],
           ),
         ),
      )
    );
  }
}
