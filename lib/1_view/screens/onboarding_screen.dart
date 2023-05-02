import 'package:amitproject/1_view/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../0_model/onboarding_model.dart';
import '../../2_controller/onboard_cubit/onboard_cubit.dart';
import '../../utility/app_colors.dart';
import '../../utility/app_images.dart';
import '../../utility/app_strings.dart';
import '../../utility/routes.dart';
import '../widgets/primary_text.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: AppImages.BackgroundIcon,
      text: AppStrings.onBoardText,
      blueText: AppStrings.onBoardTextBlue,
      text1: AppStrings.onBoardTextBlack,
      desc: AppStrings.onBoardText1,
      button: AppColors.primaryColor,
    ),
    OnboardModel(
      img: AppImages.Background1Icon,
      text: AppStrings.onBoardText2,
      blueText: AppStrings.onBoardText2Blue,
      desc: AppStrings.onBoardText3,
      button: AppColors.primaryColor,
    ),
    OnboardModel(
      img: AppImages.Background2Icon,
      text: AppStrings.onBoardText4,
      blueText: AppStrings.onBoardText4Blue,
      text1: AppStrings.onBoardText4Black,
      desc: AppStrings.onBoardText5,
      button: AppColors.primaryColor,
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardCubit, OnboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffFAFAFA),
          appBar: AppBar(
            backgroundColor: const Color(0xffFAFAFA),
            elevation: 0.0,
            title: Image.asset(
              AppImages.logo,
              height: 100,
              width: 100,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<OnboardCubit>().storeOnboardInfo();
                  controller.jumpToPage(2);
                },
                child:  PrimaryText(
                  title: "Skip",
                  color: AppColors.neutral500,
                  size: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.only(bottom: 80),
            child: PageView.builder(
              onPageChanged: (int index) {
                context.read<OnboardCubit>().changeIndex(index);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(children: [
                  SizedBox(
                      width: double.infinity,
                      height: 40.h,
                      child: Image.asset(
                        screens[index].img,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 5.h,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: screens[index].text,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 27.0,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: screens[index].blueText,
                                      style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 27.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: screens[index].text1,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 27.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ])),
                          SizedBox(height: 3.h,),
                          Text(
                            screens[index].desc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ))
                ]);
              },
              controller: controller,
            ),
          ),
          bottomSheet: Container(
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //TextButton(onPressed: ()=> controller.jumpToPage(2), child: Text('Skip',style: TextStyle(color: Colors.green),)),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ScrollingDotsEffect(
                        activeDotColor: AppColors.primaryColor,
                        activeDotScale: 1.2,
                        dotHeight: 8,
                        dotWidth: 8,
                        dotColor: AppColors.secondaryColor
                    ),
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        curve: Curves.easeInOut),
                  ),
                ),
                SizedBox(height: 5.h,),
                MainButton(
                  onPressed: () {
                    context.read<OnboardCubit>().storeOnboardInfo();
                    if(context.read<OnboardCubit>().currentIndex ==2){
                      Navigator.popAndPushNamed(context, AppRoutes.loginScreenRoute);
                    }else{
                      controller.nextPage(
                          duration: const Duration(
                            milliseconds: 400,
                          ),
                          curve: Curves.easeInOut);
                    }

                  },
                  title: context.read<OnboardCubit>().currentIndex ==2? AppStrings.getStarted:AppStrings.next,
                  textColor: Colors.white,
                  textSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                )
                //TextButton(onPressed: ()=> controller.nextPage(duration: Duration(milliseconds: 400,), curve: Curves.easeInOut), child: Text('Next',style: TextStyle(color: Colors.green),)),
              ],
            ),
          ),
        );
      },
    );
  }
}
