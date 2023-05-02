import 'package:amitproject/utility/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
   PrimaryText({Key? key,required this.title,required this.size,this.fontWeight=FontWeight.w500,this.color=Colors.black,this.maxLines=1}) : super(key: key);
  double size;
  String title;
  FontWeight? fontWeight;
  Color? color;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        fontWeight:fontWeight,
        color: color,
      ),
      maxLines: maxLines,
    );
  }
}
