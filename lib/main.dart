import 'package:amitproject/2_controller/apply_job_cubit/apply_job_cubit.dart';
import 'package:amitproject/2_controller/bottom_navigation_bar/bottomnavigationbar_cubit.dart';
import 'package:amitproject/2_controller/change_password_cubit/change_password_cubit.dart';
import 'package:amitproject/2_controller/chat_cubit/chat_cubit.dart';
import 'package:amitproject/2_controller/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/2_controller/home_cubit/home_cubit.dart';
import 'package:amitproject/2_controller/profile_cubit/profile_cubit.dart';
import 'package:amitproject/2_controller/saved_cubit/saved_cubit.dart';
import 'package:amitproject/2_controller/search_cubit/search_cubit.dart';
import 'package:amitproject/utility/router.dart';
import 'package:amitproject/utility/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sizer/sizer.dart';
import '2_controller/auth/register/register_cubit.dart';
import '2_controller/auth/login/login_cubit.dart';
import '2_controller/onboard_cubit/onboard_cubit.dart';
import '2_controller/protofolios_cubit/protofolio_cubit.dart';

void main() async{


 WidgetsFlutterBinding.ensureInitialized();
 await Locales.init(['en', 'ar']);
 //await DioHelper.init();
  SharedPreference.init();

  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return    MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
            BlocProvider(
              create: (context) => RegisterCubit(),
            ),
            BlocProvider(
              create: (context) => OnboardCubit(),
            ),
            BlocProvider(
              create: (context) => BottomNavigationBarCubit()..currentIndex=0,
            ),
            BlocProvider(
              create: (context) => ProfileCubit(),
            ),
            BlocProvider(
              create: (context) => SearchCubit(),
            ),
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
            BlocProvider(
              create: (context) => ChatCubit(),
            ),
            BlocProvider(
              create: (context) => ChangePasswordCubit(),
            ),
            BlocProvider(
              create: (context) => SavedCubit(),
            ),
            BlocProvider(
              create: (context) => ApplyJobCubit()..addToApplyScreen(),
            ),
            BlocProvider(
              create: (context) => PortfolioCubit(),
            ),
            BlocProvider(
              create: (context) => CompleteProfileCubit(),
            ),
          ],
          child:  LocaleBuilder(
            builder: (locale) =>  MaterialApp(
                debugShowCheckedModeBanner: false,

                localizationsDelegates: Locales.delegates,
                supportedLocales: Locales.supportedLocales,
                locale: locale,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    elevation: 0
                  )
                ),

                onGenerateRoute: onGenerate,
              initialRoute: AppRoutes.splashScreenRoute,

              //   localizationsDelegates: [
              //     GlobalMaterialLocalizations.delegate,
              //     GlobalWidgetsLocalizations.delegate
              //   ],
              // supportedLocales: const [
              //   Locale("en",""),
              //   Locale("ar",""),
              // ],
              //   localeResolutionCallback: (currentLang, supportedLang) {
              //     if(currentLang!=null){
              //       for(Locale locale in supportedLang){
              //         if(locale.languageCode==currentLang.languageCode){
              //           return currentLang;
              //         }
              //       }
              //     }
              //     return supportedLang.first;
               // },
              ),
          ),

        );

      },
    );
  }
}


