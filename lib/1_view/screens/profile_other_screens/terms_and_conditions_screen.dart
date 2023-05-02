import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utility/app_strings.dart';


class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_outlined)),
                PrimaryText(
                  title: AppStrings.termsConditions,
                  size: 20,
                ),
                const Text("             "),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            PrimaryText(
              title: 'Lorem ipsum dolor',
              size: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 1.h,
            ),
            PrimaryText(
              title:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
              size: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
              maxLines: 15,
            ),
            SizedBox(
              height: 2.h,
            ),
            PrimaryText(
              title: 'Lorem ipsum dolor',
              size: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 1.h,
            ),
            PrimaryText(
              title:
              'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit.  ',
              size: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
              maxLines: 15,
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.grey.shade100,
              child: PrimaryText(
                title:
                'Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
                size: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500,
                maxLines: 15,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            PrimaryText(
              title:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ',
              size: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
              maxLines: 15,
            ),
          ],
        ),
      ),
    );
  }
}
