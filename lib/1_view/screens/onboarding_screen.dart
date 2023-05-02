import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/pages.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Image(image:AssetImage(AppImages.logo),color: Colors.black,fit: BoxFit.fitWidth,)
        ),
        actions: [
          TextButton(onPressed: (){Navigator.pushNamed(context, AppRoutes.loginScreenRoute);}, child: const Text("Skip",style: TextStyle(color: AppColors.neutral500),))
        ],
      ),
      body: Stack(
        children: [
          PageView(
            dragStartBehavior: DragStartBehavior.down,
            onPageChanged: (value) {
              print (value);
            },
            controller: _controller,
            children: const [
              Page1(
                "Earn for every Referal ",
                "assets/group1.png",
                Colors.white,
              ),
              Page1(
                "Send Money Fast",
                "assets/group2.png",
                Colors.white,
              ),
              Page1(
                "Over 50 Countries",
                "assets/group3.png",
                Colors.white,
              ),
            ],
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  // SmoothPageIndicator(
                  //   controller: _controller,
                  //   count: 3,
                  // ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      fixedSize: const Size(250.0, 40.0),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
