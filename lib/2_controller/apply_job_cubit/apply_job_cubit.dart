
import 'package:amitproject/0_model/apply_job_model.dart';
import 'package:amitproject/1_view/screens/apply_job_screens/apply_job_data_submitted.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:bloc/bloc.dart';
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

List indexse=[];
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
    dioHelper.postData(
        url: applyJopEndPoint,
        token: SharedPreference.get(key: 'token'),
        data: {
          "email": email,
          "name": name,
          "mobile": phone,
          //"cv_file": cv_file,
          "work_type": work_type,
          "other_file": other_file,
          "job_id": job_id,
          "user_id": user_id,
        }).then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ApplyJobDataSubmitted(),));
      Navigator.popAndPushNamed(context, AppRoutes.applyJobDataSubmittedScreenRoute);
      var ins= SharedPreference.get(key: "applyIndex")+index.toString();
      SharedPreference.put(key: "applyIndex", value: ins);
    //  print(SharedPreference.get(key: "applyIndex"));
        addToApplyScreen();
     // print(value.data);
     emit(ApplyJobsucState());
      //print(ApplyJobModel.data[4].salary);

    }).catchError((error) {
      print(error);
      emit(ApplyJobErrorState());
    });
  }



  addToApplyScreen() {
    SharedPreference.put(key: "applyIndex", value: "");
    if (SharedPreference
        .get(key: "applyIndex")
        .toString()
        .isNotEmpty) {
      for (int i = 0; i < SharedPreference
          .get(key: "applyIndex")
          .toString()
          .length; i++) {
        var indexs = SharedPreference.get(key: "applyIndex").toString().split(
            "");
        var insss = int.parse(indexs[i]);
        map = {
          "data":
          [
            {
              "name": SuggestedJobsModel.data[insss].name.toString(),
              "id": SuggestedJobsModel.data[insss].id.toString(),
              "job_time_type":
              SuggestedJobsModel.data[insss].jobTimeType.toString(),
              "job_type": SuggestedJobsModel.data[insss].jobType.toString(),
              "job_level": SuggestedJobsModel.data[insss].jobLevel.toString(),
              "job_description":
              SuggestedJobsModel.data[insss].jobDescription.toString(),
              "job_skill": SuggestedJobsModel.data[insss].jobSkill.toString(),
              "salary": SuggestedJobsModel.data[insss].salary.toString(),
              "expired": SuggestedJobsModel.data[insss].expired.toString(),
              "favorites": SuggestedJobsModel.data[insss].favorites.toString(),
              "location": SuggestedJobsModel.data[insss].location.toString(),
              "about_comp": SuggestedJobsModel.data[insss].aboutComp.toString(),
              "comp_website": SuggestedJobsModel.data[insss].compWebsite
                  .toString(),
              "comp_email": SuggestedJobsModel.data[insss].compEmail.toString(),
              "comp_name": SuggestedJobsModel.data[insss].compName.toString(),
              "image": SuggestedJobsModel.data[insss].image.toString(),
            }
          ]
        };
        emit(ApplyJobSuccessState(applyJobModel: ApplyJobModel.fromJson(map)));
      }
    }
  }


}
