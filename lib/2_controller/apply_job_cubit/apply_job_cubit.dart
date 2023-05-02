
import 'dart:io';
import 'package:amitproject/0_model/apply_job_model.dart';
import 'package:amitproject/1_view/screens/apply_job_screens/apply_job_data_submitted.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../0_model/suggested_jobs_model.dart';
import '../../utility/constants.dart';
import '../../utility/routes.dart';
import '../database/shared/dio/dio_helper.dart';

part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit() : super(ApplyJobInitial());

  DioHelper dioHelper=DioHelper();

Map <String,dynamic>map={};


int currentIndex=0;
  changeIndex(index) {
    currentIndex = index;
    emit(ApplyJobFChangeIndexState());
  }

  String? filePath;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    File file;
    if (result != null) {
      file = File(result.files.single.path ?? ' ');
      filePath = file.path;
      //cv_file =await MultipartFile.fromFile(filePath!,);
    }
  }


  Future applyJob({
     required var index,
    required String email,
    required String name,
    required String phone,
    required String work_type,
    required String other_file,
    required String job_id,
    required String user_id,
    required context
  }) async {
    emit(ApplyJobLoadingState());
   // map.clear();

    FormData data = FormData.fromMap({
      "email": email,
      "name": name,
      "mobile": phone,
      // 'cv_file': await MultipartFile.fromFile(
      //   filePath!,
      // ),
      "work_type": work_type,
      "other_file": other_file,
      "job_id": job_id,
      "user_id": user_id,
    });
    dioHelper.postData(
        url: applyJopEndPoint,
        token: SharedPreference.get(key: 'token'),
        data: data
    ).then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ApplyJobDataSubmitted(),));
      Navigator.popAndPushNamed(context, AppRoutes.applyJobDataSubmittedScreenRoute);
      var ins= SharedPreference.get(key: "applyId").toString()=="null"?job_id.toString():"${SharedPreference.get(key: "applyId")}#$job_id";
      SharedPreference.put(key: "applyId", value: ins);
      print(value.data);
        addToApplyScreen();
     emit(ApplyJobSuccessState());
    }).catchError((error) {
      emit(ApplyJobErrorState());
      throw error;
    });
  }



  addToApplyScreen() {
    ApplyJobModel.data.clear();
    if (SharedPreference
        .get(key: "applyId")
        .toString()
        !="null") {
      var ides = SharedPreference.get(key: "applyId").toString().split("#");
      List setIdes = ides.toSet().toList();


        for(int j = 0; j <SuggestedJobsModel.data.length; j++){
          if(setIdes.contains(SuggestedJobsModel.data[j].id.toString())){
            map = {
              "data":
              [
                {
                  "name": SuggestedJobsModel.data[j].name.toString(),
                  "id": SuggestedJobsModel.data[j].id.toString(),
                  "job_time_type":
                  SuggestedJobsModel.data[j].jobTimeType.toString(),
                  "job_type": SuggestedJobsModel.data[j].jobType.toString(),
                  "job_level": SuggestedJobsModel.data[j].jobLevel.toString(),
                  "job_description":
                  SuggestedJobsModel.data[j].jobDescription.toString(),
                  "job_skill": SuggestedJobsModel.data[j].jobSkill.toString(),
                  "salary": SuggestedJobsModel.data[j].salary.toString(),
                  "expired": SuggestedJobsModel.data[j].expired.toString(),
                  "favorites": SuggestedJobsModel.data[j].favorites.toString(),
                  "location": SuggestedJobsModel.data[j].location.toString(),
                  "about_comp": SuggestedJobsModel.data[j].aboutComp.toString(),
                  "comp_website": SuggestedJobsModel.data[j].compWebsite
                      .toString(),
                  "comp_email": SuggestedJobsModel.data[j].compEmail.toString(),
                  "comp_name": SuggestedJobsModel.data[j].compName.toString(),
                  "image": SuggestedJobsModel.data[j].image.toString(),
                }
              ]
            };
            emit(GetApplyJobSuccessState(applyJobModel: ApplyJobModel.fromJson(map)));
          }
          }
        }


    }






}
