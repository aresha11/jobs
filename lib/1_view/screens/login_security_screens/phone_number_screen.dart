import 'package:amitproject/1_view/widgets/input_field.dart';
import 'package:amitproject/2_controller/change_password_cubit/change_password_cubit.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';
import '../../../utility/app_colors.dart';
import '../../../utility/app_strings.dart';
import '../../widgets/main_button.dart';
import '../../widgets/primary_text.dart';

class PhoneNumberScreen extends StatefulWidget {
  PhoneNumberScreen({Key? key}) : super(key: key);

  bool value=true;
  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    phoneController.text = SharedPreference.get(key: "${SharedPreference.get(key: "loginEmail")}mobile").toString()=="null"?"Add a address": SharedPreference.get(key: "mobile");
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
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
                      title: AppStrings.emailAddress,
                      size: 20,
                    ),
                    const Text("             "),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      PrimaryText(
                        title: "Main phone number",
                        size: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
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
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: PrimaryText(
                            title:
                                "Use the phone number to reset your\npassword",
                            size: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.neutral500,
                          )),
                          FlutterSwitch(
                            height: 5.h,
                            activeColor: AppColors.primaryColor,
                            inactiveColor: Color(0xffD1D5DB),
                            value:widget.value,
                            onToggle: (bool value) {
                              setState(() {
                                widget.value = value;
                              });
                            },
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 52.h,
                      ),
                      MainButton(
                        textColor: Colors.white,
                        textSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: AppStrings.save,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
