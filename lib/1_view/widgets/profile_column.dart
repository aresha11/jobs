import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/1_view/widgets/secondary_text.dart';
import 'package:flutter/material.dart';

class ProfileColumn extends StatelessWidget {
   ProfileColumn({Key? key,required this.title,required this.number}) : super(key: key);

   String title;
   String number;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SecondaryText(title: title, size: 15),
        PrimaryText(title: number, size: 20)
      ],
    );
  }
}
