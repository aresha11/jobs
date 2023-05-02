import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Page1 extends StatelessWidget {
  const Page1(this.heading, this.image, this.backGround, {super.key});
  final String heading;
  final String image;
  final Color backGround;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Center(
        child: Column(
          children: [
            Image.asset(image,fit: BoxFit.cover,height: 400,width: 400,),
            SizedBox(
              height: 10.h,
            ),
            Text(
              heading,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}