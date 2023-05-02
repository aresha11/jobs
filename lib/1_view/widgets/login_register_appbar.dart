import 'package:flutter/material.dart';

class LoginRegisterAppBar extends StatelessWidget {

   const LoginRegisterAppBar({Key? key,}) : super(key: key);
 // IconData? icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
     // leading: IconButton(onPressed: (){}, icon:Icons.icon ),
      actions: [
        Image.asset("assets/Logo.png"),
      ],
    );
  }
}
