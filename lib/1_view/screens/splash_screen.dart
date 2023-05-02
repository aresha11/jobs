import 'dart:async';
import 'package:amitproject/utility/app_images.dart';
import 'package:flutter/material.dart';
import '../../2_controller/database/local/shared_preference.dart';
import '../../utility/routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 1,),
          () => SharedPreference.get(key: "loggedIn")=="true"?
              Navigator.pushReplacementNamed(context, AppRoutes.homeLayoutRoute):
          Navigator.pushReplacementNamed(context, AppRoutes.loginScreenRoute)
      ,);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ImageIcon(AssetImage(AppImages.logo)),
      )

    );
  }
}
