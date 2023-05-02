import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utility/app_colors.dart';


// ignore: must_be_immutable
class PreferredLocationItem extends StatefulWidget {
   PreferredLocationItem({Key? key,required this.text,required this.img}) : super(key: key);

  String img;
  String text;


  @override
  State<PreferredLocationItem> createState() => _PreferredLocationItemState();
}

class _PreferredLocationItemState extends State<PreferredLocationItem> {

  bool isClicked =false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor:Colors.transparent ,
      splashColor: Colors.transparent ,
      onTap: (){
        setState(() {

        });
          isClicked =!isClicked;
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color:isClicked?AppColors.secondaryColor:Color(0xffF4F4F5),
            borderRadius: BorderRadius.circular(18),
            border:
            Border.all(color:isClicked? AppColors.primaryColor:Colors.grey[200]!)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                radius: 10, child: Image.asset(widget.img.toString())),
            SizedBox(
              width: 2.w,
            ),
            PrimaryText(title: widget.text, size: 16,fontWeight: FontWeight.w400,)
          ],
        ),
      ),
    );
  }
}
