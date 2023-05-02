import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_colors.dart';


class LoginAndSecurityRow extends StatelessWidget {
   LoginAndSecurityRow({Key? key,required this.firstTitle,this.secondTitle="",required this.nextPage}) : super(key: key);
  String firstTitle;
  String secondTitle;
  String nextPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
     child: Column(
       children: [
         Row(
            children: [
              Expanded(child: PrimaryText(title: firstTitle, size: 16,fontWeight: FontWeight.w400,color:AppColors.blackColor)),
              PrimaryText(title: secondTitle, size: 14,fontWeight: FontWeight.w400,color: AppColors.neutral500,),
              IconButton(onPressed: (){
                Navigator.pushNamed(context, nextPage);
              }, icon: const Icon(Icons.arrow_forward,color: Color(0xff111827),size: 15,)),
            ],
          ),
         SizedBox(height: 1.h,),
         Divider(height: 1,thickness: 1,),
         SizedBox(height: 1.h,),
       ],
     )
    );
  }
}
