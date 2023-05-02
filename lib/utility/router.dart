import 'package:amitproject/1_view/screens/apply_job_screens/apply_job_data_submitted.dart';
import 'package:amitproject/1_view/screens/auth/register/complete_register.dart';
import 'package:amitproject/1_view/screens/auth/register/interested_work.dart';
import 'package:amitproject/1_view/screens/auth/register/preferred_location.dart';
import 'package:amitproject/1_view/screens/chat_screen.dart';
import 'package:amitproject/1_view/screens/apply_job_screens/job_detail.dart';
import 'package:amitproject/1_view/screens/onboarding_screen.dart';
import 'package:amitproject/1_view/screens/profile_screens/change_password_screen.dart';
import 'package:amitproject/1_view/screens/profile_screens/edit_profile_screen.dart';
import 'package:amitproject/1_view/screens/profile_screens/email_address_screen.dart';
import 'package:amitproject/1_view/screens/profile_screens/help_center_screen.dart';
import 'package:amitproject/1_view/screens/profile_screens/login_and_security_screen.dart';
import 'package:amitproject/1_view/screens/profile_screens/phone_number_screen.dart';
import 'package:amitproject/1_view/screens/profile_screens/privacy_and_policy_screen.dart';
import 'package:amitproject/1_view/screens/profile_screens/terms_and_conditions_screen.dart';
import 'package:amitproject/1_view/screens/profile_screens/two_step_verification_screen4.dart';
import 'package:amitproject/1_view/screens/profile_screens/two_step_verification_screen2.dart';
import 'package:amitproject/1_view/screens/profile_screens/two_step_verification_screen3.dart';
import 'package:amitproject/1_view/screens/search_screen.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:flutter/material.dart';

import '../1_view/screens/apply_job_screens/apply_job_bio_data.dart';
import '../1_view/screens/home_layout.dart';
import '../1_view/screens/auth/login/login_screen.dart';
import '../1_view/screens/auth/register/register_screen.dart';
import '../1_view/screens/profile_screens/two_step_verification_screen.dart';
import '../1_view/screens/splash_screen.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.registerScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const RegisterScreen(), settings: routeSettings);
      case AppRoutes.interestedWorkScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const InterestedWork(), settings: routeSettings);
    case AppRoutes.preferredLocationRoute:
      return MaterialPageRoute(
          builder: (context) =>  PreferredLocation(), settings: routeSettings);
      case AppRoutes.completeRegisterRoute:
      return MaterialPageRoute(
          builder: (context) => const CompleteRegister(), settings: routeSettings);
      case AppRoutes.homeLayoutRoute:
      return MaterialPageRoute(
          builder: (context) => const HomeLayout(), settings: routeSettings);
      case AppRoutes.searchScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const SearchScreen(), settings: routeSettings);
      case AppRoutes.editProfileRoute:
      return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(), settings: routeSettings);
      case AppRoutes.chatScreen:
      return MaterialPageRoute(
          builder: (context) =>  ChatScreen(), settings: routeSettings);
      case AppRoutes.onBoardingScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(), settings: routeSettings);
      case AppRoutes.loginAndSecurity:
      return MaterialPageRoute(
          builder: (context) => const LoginAndSecurityScreen(), settings: routeSettings);
      case AppRoutes.changePassword:
      return MaterialPageRoute(
          builder: (context) =>  ChangePasswordScreen(), settings: routeSettings);
      case AppRoutes.emailAddress:
      return MaterialPageRoute(
          builder: (context) => const EmailAddressScreen(), settings: routeSettings);
      case AppRoutes.phoneNumberScreen:
      return MaterialPageRoute(
          builder: (context) =>  PhoneNumberScreen(), settings: routeSettings);
      case AppRoutes.twoStepVerification:
      return MaterialPageRoute(
          builder: (context) => const TwoStepVerificationScreen(), settings: routeSettings);
      case AppRoutes.twoStepVerification2:
      return MaterialPageRoute(
          builder: (context) => const TwoStepVerificationScreen2(), settings: routeSettings);
      case AppRoutes.twoStepVerification3:
      return MaterialPageRoute(
          builder: (context) => const TwoStepVerificationScreen3(), settings: routeSettings);
      case AppRoutes.twoStepVerification4:
      return MaterialPageRoute(
          builder: (context) => const TwoStepVerificationScreen4(), settings: routeSettings);
      case AppRoutes.helpCenterRoute:
      return MaterialPageRoute(
          builder: (context) => const HelpCenterScreen(), settings: routeSettings);
      case AppRoutes.termsAndConditionRoute:
      return MaterialPageRoute(
          builder: (context) => const TermsAndConditionScreen(), settings: routeSettings);
      case AppRoutes.privacyPolicyRoute:
      return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyScreen(), settings: routeSettings);
      // case AppRoutes.applyJobBioDataScreenRoute:
      // return MaterialPageRoute(
      //     builder: (context) =>  ApplyJobBioDataScreen(), settings: routeSettings);
      case AppRoutes.applyJobDataSubmittedScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const ApplyJobDataSubmitted(), settings: routeSettings);

    case AppRoutes.loginScreenRoute:

      return MaterialPageRoute(
          builder: (context) => const LoginScreen(), settings: routeSettings);

  case AppRoutes.splashScreenRoute:
    default:
  return MaterialPageRoute(
  builder: (context) => const SplashScreen(), settings: routeSettings);
  }
}