import 'package:amitproject/utility/app_colors.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';
import '../../../2_controller/database/local/shared_preference.dart';
import '../../../utility/app_images.dart';
import '../../../utility/app_strings.dart';
import '../../../utility/routes.dart';
import '../../widgets/input_field.dart';
import '../../widgets/main_button.dart';
import '../../widgets/primary_text.dart';

class TwoStepVerificationScreen3 extends StatefulWidget {
  const TwoStepVerificationScreen3({Key? key}) : super(key: key);

  @override
  State<TwoStepVerificationScreen3> createState() => _TwoStepVerificationScreenState();
}

class _TwoStepVerificationScreenState extends State<TwoStepVerificationScreen3> {
  var phoneController = TextEditingController();
  bool value1=false;

  @override
  Widget build(BuildContext context) {
    phoneController.text = SharedPreference.get(key: "mobile");
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
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
                  title: AppStrings.twoStepVerification,
                  size: 20,
                ),
                const Text("             "),
              ],
            ),
            SizedBox(height: 3.h,),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 PrimaryText(title: AppStrings.addPhoneNumber, size: 16,fontWeight: FontWeight.w500,),
                 SizedBox(height: 1.h,),
                 PrimaryText(title: AppStrings.weWillSendVerificationCodeToThisNumber, size: 14,fontWeight: FontWeight.w400,color: AppColors.neutral500,),
                 SizedBox(height: 2.h,),
                 InputField(
                   controller: phoneController,
                   validated: (v) {},
                   onchange: (v) {},
                   onEditingComplete: () {},
                   onFieldSubmitted: () {},
                   prefixIcon: CountryListPick(
                       theme: CountryTheme(
                         isShowFlag: true,
                         isShowTitle: false,
                         isShowCode: false,
                         isDownIcon: true,
                         showEnglishName: false,
                       ),
                       // Set default value
                       //initialSelection: '+20',
                       // or
                       initialSelection: 'US',
                       onChanged: (code) {
                         // print(code.name);
                         // print(code.code);

                         print(code?.dialCode);
                         // print(code.flagUri);
                       },
                       // Whether to allow the widget to set a custom UI overlay
                       useUiOverlay: false,
                       // Whether the country list should be wrapped in a SafeArea
                       useSafeArea: false),
                 ),
                 SizedBox(height: 3.h,),
                 PrimaryText(
                   title: AppStrings.enterYourPassword,
                   size: 16,
                   fontWeight: FontWeight.w500,
                 ),
                 SizedBox(height: 3.h,),
                 InputField(
                   maxLines: 1,
                   secure: true,

                   validated: (String value) {

                   },
                   onchange: (v) {},
                   onEditingComplete: () {},
                   onFieldSubmitted: () {},
                   hint: AppStrings.enterYourNewPassword,
                   prefixIcon: ImageIcon(
                     AssetImage(AppImages.passwordIcon),
                   ),
                   suffixIcon: Icons.remove_red_eye,
                 ),
                 SizedBox(height: 43.h,),
                 MainButton(
                   textColor: Colors.white,
                   textSize: 16,
                   fontWeight: FontWeight.w600,
                   color: AppColors.primaryColor,
                   onPressed: () {
                     Navigator.pushNamed(context, AppRoutes.twoStepVerification4);
                   },
                   title: AppStrings.sendCode,
                 )
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
