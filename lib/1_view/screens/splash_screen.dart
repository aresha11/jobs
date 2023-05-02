import 'dart:async';

import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:flutter/material.dart';
import '../../utility/app_images.dart';
import '../../utility/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 4),
            () => Navigator.popAndPushNamed(
            context,
                SharedPreference.get(key: 'loggedIn') == 'true'
                ? AppRoutes.homeLayoutRoute
                : SharedPreference.get(key: 'onBoard') != 0
                ? AppRoutes.onBoardingScreenRoute
                : AppRoutes.loginScreenRoute));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(AppImages.blurIcon, fit: BoxFit.fill)),
            Image.asset(
              AppImages.logo,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
