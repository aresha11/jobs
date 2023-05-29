import 'package:amitproject/2_controller/bottom_navigation_bar/bottomnavigationbar_cubit.dart';
import 'package:amitproject/2_controller/chat_cubit/chat_cubit.dart';
import 'package:amitproject/2_controller/profile_cubit/profile_cubit.dart';
import 'package:amitproject/utility/app_colors.dart';
import 'package:amitproject/utility/app_images.dart';
import 'package:amitproject/utility/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../2_controller/home_cubit/home_cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<BottomNavigationBarCubit>().currentIndex=0;
    context.read<HomeCubit>().getAllJobs();
    context.read<HomeCubit>().getSuggestedJobs();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   var cubit=context.read<BottomNavigationBarCubit>();
    return BlocConsumer<BottomNavigationBarCubit, BottomNavigationBarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.secondaryButtonColor,
            onTap: (index){
              cubit.changeIndex(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppImages.home,)),label: AppStrings.home ),
              BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppImages.message)),label: AppStrings.messages ),
              BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppImages.applied)),label: AppStrings.applied ),
              BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppImages.archiveWhite)),label: AppStrings.archived ),
              BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppImages.profile)),label: AppStrings.profile ),
            ],
          ),
        );
      },
    );
  }
}
