import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_colors.dart';

class CompleteProfileScreenItem extends StatefulWidget {
  CompleteProfileScreenItem({Key? key,required this.text,required this.mainText,required this.isCompleted,required this.route,}) : super(key: key);
  String mainText;
  String text;
  String route;
  bool isCompleted;
  @override
  State<CompleteProfileScreenItem> createState() => _CompleteProfileScreenItemState();
}

class _CompleteProfileScreenItemState extends State<CompleteProfileScreenItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
      height: 12.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: widget.isCompleted? AppColors.primaryColor:Colors.grey.shade400, width: .5),
          color: widget.isCompleted? AppColors.secondaryColor:Colors.transparent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor:widget.isCompleted? AppColors.primaryColor:Colors.grey.shade400,
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                title: widget.mainText,
                size: 12.sp,
                fontWeight: FontWeight.w500,
                //color: Colors.grey.shade500,
                maxLines: 2,
              ),
              SizedBox(height: 1.h,),
              PrimaryText(
                title: widget.text,
                size: 10.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500,
                maxLines: 2,
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, widget.route);
            },
            child: const Icon(
              Icons.arrow_forward,
            ),
          )
        ],
      ),
    );
  }
}