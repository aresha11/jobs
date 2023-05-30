import 'dart:io';
import 'package:flutter/material.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/2_controller/database/shared/dio/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import '../../0_model/complete_profile_model.dart';
import '../../0_model/edit_profile_bio_address_mobile_model.dart';
import '../../utility/constants.dart';
import '../../utility/routes.dart';
part 'complete_profile_state.dart';


class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileInitial());

  double percentage =SharedPreference.get(key: "${SharedPreference.get(key: "loginEmail")}percentage").toString()=="null"?0:SharedPreference.get(key: "${SharedPreference.get(key: "loginEmail")}percentage");
  DioHelper dioHelper=DioHelper();

  changePercentage(){
    if(percentage<1){
      percentage= percentage +.25;
    }
    SharedPreference.put(key: "${SharedPreference.get(key: "loginEmail")}percentage", value: percentage);
    emit(ChangePercentageState());
  }


  List<CompleteProfileModel> items = [
    CompleteProfileModel(
        mainText: "personal Details",
        text: "Full Name Email",
        isCompleted:SharedPreference.get(key: "${SharedPreference.get(key: "email")}entered edit mobile").toString()=="null"? false:true,
        route: AppRoutes.personalDetailsScreenRoute),
    CompleteProfileModel(
        mainText: "Education",
        text: "Enter Your Educational",
        isCompleted:SharedPreference.get(key: "${SharedPreference.get(key: "email")}entered edit education").toString()=="null"? false:true,
        route: AppRoutes.educationScreenRoute),
    CompleteProfileModel(
        mainText: "Experience",
        text: "Enter Your Work Experience",
        isCompleted: SharedPreference.get(key: "${SharedPreference.get(key: "email")}entered edit exp").toString()=="null"? false:true,
        route: AppRoutes.experienceScreenRoute),
    CompleteProfileModel(
        mainText: "Portfolio Screen",
        text: "Create Your Portfolio",
        isCompleted:SharedPreference.get(key: "${SharedPreference.get(key: "email")}entered edit port").toString()=="null"? false:true,
          route: AppRoutes.completePortfolioScreenRoute),
  ];

  checkIfCompleted(index) {
    emit(CheckIfCompletedState());
  }


  void editProfileBioAddressMobile({
    String? bio,
    String? address,
    String? mobile,
  }) {
    emit(LoadingState());
    dioHelper.putData(
      data: {
        "bio":bio,
        "address":address,
        "mobile":mobile,
      },
      url:editProfileBioAddressMobileEndPoint+SharedPreference.get(key: "id").toString(),
      token: SharedPreference.get(key: "token") ,
    ).then((value) {
      if (value.statusCode ==200) {
        emit(EditProfileBioAddressMobileSuccessState(editProfileBioAddressMobileModel: EditProfileBioAddressMobileModel.fromJson(value.data)));
        SharedPreference.put(key: "bio", value: EditProfileBioAddressMobileModel.data!.bio.toString());
        SharedPreference.put(key: "address", value: EditProfileBioAddressMobileModel.data!.address.toString());
        SharedPreference.put(key: "mobile", value: EditProfileBioAddressMobileModel.data!.mobile.toString());


        if(SharedPreference.get(key: "${SharedPreference.get(key: "email")}entered edit mobile").toString()=="null"){
          changePercentage();
          SharedPreference.put(key: "${SharedPreference.get(key: "email")}entered edit mobile", value: 1);
        }
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(EditProfileBioAddressMobileFailedState());
      throw error;
    });
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
      if(SharedPreference.get(key: "${SharedPreference.get(key: "email")}entered edit education").toString()=="null"){
        changePercentage();
        SharedPreference.put(key: "${SharedPreference.get(key: "email")}entered edit education", value: 1);
      }
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
      if(SharedPreference.get(key: "${SharedPreference.get(key: "email")}entered edit exp").toString()=="null"){
        changePercentage();
        SharedPreference.put(key: "${SharedPreference.get(key: "email")}entered edit exp", value: 1);
      }
      emit(ExperienceSuccessState());
      Navigator.popAndPushNamed(context, AppRoutes.completeProfileScreenRoute);
    }).catchError((error) {
      print(error);
      emit(ExperienceErrorState());
    });
  }



  addPortfolio() async {
    emit(AddPortfolioLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ["pdf"]);
    File? file;
    if (result != null) {
      file = File(result.files.single.path!);
      FormData data = FormData.fromMap(
          {'cv_file': await MultipartFile.fromFile(file.path), 'name': file.hashCode});
      dioHelper
          .postData(
          url: addPortfolioEndPoint +
              SharedPreference.get(key: "id").toString(),
          token: SharedPreference.get(key: 'token'),
          data: data)
          .then((value) {
        if(SharedPreference.get(key: "${SharedPreference.get(key: "email")}entered edit port").toString()=="null"){
          changePercentage();
          SharedPreference.put(key: "${SharedPreference.get(key: "email")}entered edit port", value: 1);
        }
        emit(AddPortfolioSuccessState());
      }).catchError((onError) {
        emit(AddPortfolioFailedInitial());
        throw onError;
      });
    }
  }




}
