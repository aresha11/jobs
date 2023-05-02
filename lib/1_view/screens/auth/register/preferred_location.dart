import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:amitproject/1_view/widgets/primary_text.dart';
import 'package:amitproject/1_view/widgets/secondary_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../0_model/location_pick_model.dart';
import '../../../../utility/app_colors.dart';
import '../../../../utility/app_strings.dart';
import '../../../../utility/routes.dart';
import '../../../widgets/preferred_location_item.dart';



class PreferredLocation extends StatefulWidget {
  PreferredLocation({Key? key}) : super(key: key);

  @override
  State<PreferredLocation> createState() =>
      _PreferredLocationState();
}

class _PreferredLocationState extends State<PreferredLocation> {
  List<LocationPickModel> items = [
    LocationPickModel(text: "United States", img: 'assets/United States.png'),
    LocationPickModel(text: "Malaysia", img: 'assets/Malaysia.png'),
    LocationPickModel(text: 'Singapore', img: 'assets/Singapore.png'),
    LocationPickModel(text: 'Indonesia', img: 'assets/Indonesia.png'),
    LocationPickModel(text: 'Philiphines', img: 'assets/Philiphines.png'),
    LocationPickModel(text: 'Polandia', img: 'assets/Polandia.png'),
    LocationPickModel(text: 'India', img: 'assets/India.png'),
    LocationPickModel(text: 'Vietnam', img: 'assets/vitenam.png'),
    LocationPickModel(text: 'China', img: 'assets/china.png'),
    LocationPickModel(text: 'Canada', img: 'assets/canada.png'),
    LocationPickModel(text: 'Saudi Arabia', img: 'assets/saudi.png'),
    LocationPickModel(text: 'Argentina', img: 'assets/argentina.png'),
    LocationPickModel(text: 'Brazil', img: 'assets/brazil.png'),
  ];

  bool isClicked= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    PrimaryText(
                      title: AppStrings.whereAreYouPreferredLocation,
                      size: 24.sp,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                     SecondaryText(
                      title: AppStrings.letUsKnowWhereIsTheWorkLocation,
                      size: 16,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    ToggleSwitch(
                      minWidth: 45.w,
                      cornerRadius: 22.0,
                      fontSize: 14,
                      minHeight: 6.h,
                      activeBgColor: [AppColors.primaryColorDark],
                      //activeBgColors: [[AppColors.primaryColor], [AppColors.primaryColor]],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Color(0xffF4F4F5),
                      inactiveFgColor: Color(0xff6B7280),
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      labels: [AppStrings.workFromOffice, AppStrings.remoteWork],
                      radiusStyle: true,
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                     SecondaryText(
                      title: AppStrings.selectTheCountry,
                      size: 16,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 43.h,
                      child: Wrap(
                        //direction: Axis.horizontal,
                        spacing: 10, // space between items
                        children: items
                            .map((e) => PreferredLocationItem(text:e.text ,img:e.img ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              MainButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.completeRegisterRoute);

                },
                title: AppStrings.next,
                color: AppColors.primaryColor,
                textColor: Colors.white,
                textSize: 16,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
