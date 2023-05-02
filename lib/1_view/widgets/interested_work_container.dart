import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InterestedWorkContainer extends StatefulWidget {
    InterestedWorkContainer({Key? key,required this.title,required this.imageIcon}) : super(key: key);

    String title;
    String imageIcon;

  @override
  State<InterestedWorkContainer> createState() => _InterestedWorkContainerState();
}


class _InterestedWorkContainerState extends State<InterestedWorkContainer> {
 Color containerColor=const Color(0x4AD1D5DB);
 Color borderColor=AppColors.neutral400;
 double borderWidth=.8;
 Color iconColor=AppColors.blackColor;
 Color iconBackGroundColor=AppColors.neutral200;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        if(borderWidth==.8){
          containerColor=AppColors.secondaryColor;
          borderColor=AppColors.primaryColor;
          borderWidth=1.5;
          iconColor=AppColors.primaryColor;
          iconBackGroundColor=Colors.white;
         // SharedPreference.put(key: "text", value: widget.title);
          if(SharedPreference.get(key: "text").toString()=="null"){
            print("if");
            SharedPreference.put(key: "text", value: widget.title);
          }else{
            print("else");
            SharedPreference.put(key: "text", value:  "${widget.title}  and  "  +SharedPreference.get(key: "text"));
          }

          print(SharedPreference.get(key: "text"));
        }else{
          //SharedPreference.clearData();
           containerColor=const Color(0x4AD1D5DB);
           borderColor=AppColors.neutral400;
           borderWidth=.8;
           iconColor=AppColors.blackColor;
           iconBackGroundColor=AppColors.neutral200;
          List list=["null"];
          for(int i=0 ;i<SharedPreference.get(key: "text").toString().split("  and  ").length;i++){
             list=SharedPreference.get(key: "text").toString().split("  and  ");
             print(list);
            if(widget.title==list[i]){
              list.removeAt(i);
            }
          }
          if(list.isEmpty){
            list=["null"];
          }
          SharedPreference.put(key: "text",value: list.join());
          print(SharedPreference.get(key: "text"));
        }

        setState(() {

        });
      },
      child: Container(
        height: 30,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          border: Border.all(color:borderColor,width: borderWidth),
          borderRadius: BorderRadius.circular(20),
          color: containerColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.neutral400,
              radius: 23,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: iconBackGroundColor,
                  child: ImageIcon(AssetImage(widget.imageIcon),size: 30.sp,color: iconColor)),
            ),
            PrimaryText(title:widget.title , size: 13.sp,fontWeight: FontWeight.w400,maxLines: 2,)
          ],
        ),
      ),
    );
  }
}
