import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_colors.dart';
import '../../utility/app_strings.dart';



class ApplyJobTypeOfWorkItem extends StatefulWidget {
   ApplyJobTypeOfWorkItem({Key? key,required this.text,required this.index,}) : super(key: key);
  String text;
  int index;
   bool isClicked= false;
   List items =[
     AppStrings.seniorUXDesigner,
     AppStrings.seniorUIDesigner,
     AppStrings.graphikDesigner,
     AppStrings.frontEndDeveloper
   ];
  @override
  State<ApplyJobTypeOfWorkItem> createState() => _ApplyJobTypeOfWorkItemState();
}


class _ApplyJobTypeOfWorkItemState extends State<ApplyJobTypeOfWorkItem> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        setState(() {
          widget.isClicked=!widget.isClicked;

        });
        print(widget.text);

      },
      child: Container(
        padding: EdgeInsets.all(15),
        height: 12.h,
        decoration: BoxDecoration(
          color: widget.isClicked?AppColors.secondaryColor:Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:widget.isClicked? AppColors.primaryColor:AppColors.neutral200, )),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    title: widget.text,
                    size: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      PrimaryText(
                        title: AppStrings.cv,
                        fontWeight: FontWeight.w400,
                        size: 14,
                      ),
                      SizedBox(
                        width: .75.w,
                      ),
                      Container(
                        height: 3,
                        width: 3,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.neutral200),
                      ),
                      SizedBox(
                        width: .75.w,
                      ),
                      PrimaryText(
                        title: AppStrings.portfolio,
                        fontWeight: FontWeight.w400,
                        size: 14,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(1),
              height: 5.h,
              width: 5.w,
              decoration: BoxDecoration(
                border: Border.all(color:Color(0xffACAEBE),width: 1.25 ),
                shape: BoxShape.circle,
                color: Colors.transparent
              ),
              child:CircleAvatar(
                radius: 8,
                backgroundColor:widget.isClicked? AppColors.primaryColor:Colors.transparent,
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
