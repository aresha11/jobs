import 'package:flutter/material.dart';

class SecondaryText extends StatelessWidget {
  SecondaryText({Key? key,required this.title,required this.size}) : super(key: key);
  double size;
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w400,
        color:const Color(0xff6B7280),
      ),
    );
  }
}
