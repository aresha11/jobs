import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/2_controller/database/shared/dio/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../0_model/complete_profile_model.dart';
import '../../utility/app_strings.dart';
import '../../utility/constants.dart';
import '../../utility/routes.dart';
part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileInitial());

  double percentage =0;
  DioHelper dioHelper=DioHelper();

  changePercentage(){
    percentage= percentage +.25;
    emit(ChangePercentageState());
  }

  List<CompleteProfileModel> items = [
    CompleteProfileModel(
        mainText: "personal Details",
        text: "Full Name Email",
        isCompleted: true,
        route: AppRoutes.personalDetailsScreenRoute),
    CompleteProfileModel(
        mainText: "Education",
        text: "Enter Your Educational",
        isCompleted: false,
        route: AppRoutes.educationScreenRoute),
    CompleteProfileModel(
        mainText: "Experience",
        text: "Enter Your Work Experience",
        isCompleted: false,
        route: AppRoutes.experienceScreenRoute),
    CompleteProfileModel(
        mainText: "Portfolio Screen",
        text: "Create Your Portfolio",
        isCompleted: false,
          route: AppRoutes.completePortfolioScreenRoute),
  ];

  checkIfCompleted(index) {
    emit(CheckIfCompletedState());
  }

  Future addEducation({
    required String universty,
    required String title,
    required String start,
    required String end,
    required context
  }) async {
    print(SharedPreference.get(key: 'token'));
    print(SharedPreference.get(key: 'id'));
    emit(EducationLoadingState());
    dioHelper.postData(
        url: educationEndPoint,
        data: {
          "universty": universty,
          "title": title,
          "start": start,
          "end": end,
          "user_id": SharedPreference.get(key: 'id').toString(),
        },
        token: SharedPreference.get(key: 'token')
    ).then((value) {
      changePercentage();
      emit(EducationSuccessState());
      Navigator.popAndPushNamed(context, AppRoutes.completeProfileScreenRoute);
    }).catchError((error) {
      print(error);
      emit(EducationErrorState());
      throw error;
    });
  }



  Future addExperience({
    required String postion,
    required String type_work,
    required String comp_name,
    required String location,
    required String start,
    required context
  }) async {
    emit(ExperienceLoadingState());
    dioHelper.postData(url: experienceEndPoint,
        data: {
          "postion": postion,
          "type_work": type_work,
          "comp_name": comp_name,
          "location": location,
          "start": start,
          "user_id": SharedPreference.get(key: 'id').toString(),
        },
        token: SharedPreference.get(key: 'token')
    ).then((value) {
      changePercentage();
      emit(ExperienceSuccessState());
      Navigator.popAndPushNamed(context, AppRoutes.completeProfileScreenRoute);
    }).catchError((error) {
      print(error);
      emit(ExperienceErrorState());
    });
  }


}
