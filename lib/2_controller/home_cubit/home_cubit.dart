import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/2_controller/database/shared/dio/dio_helper.dart';
import 'package:amitproject/utility/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../0_model/recent_jobs_model.dart';
import '../../0_model/suggested_jobs_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<dynamic>chats=[];
  List<Map>chats1=[];

DioHelper dioHelper=DioHelper();





 void  getAllJobs({index})async {
   RecentJobsModel.data.clear();
    emit(LoadingDataState());
   await dioHelper.getData(
        url:allJobsEndPoint,
     token: SharedPreference.get(key: "token") ,
        ).then((value) {
      if (value.statusCode ==200) {
        emit(GetDataSuccessState(jobsModel:RecentJobsModel.fromJson(value.data) ));
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetDataErrorState());
    });
  }




  void getSuggestedJobs() {
   SuggestedJobsModel.data.clear();
    emit(LoadingSuggestedDataState());
    dioHelper.getData(
        url:suggestedJopEndPoint+SharedPreference.get(key: "id").toString(),
     token: SharedPreference.get(key:"token"),
        ).then((value) {
      if (value.statusCode ==200) {
        emit(GetSuggestedDataSuccessState(suggestedJobsModel: SuggestedJobsModel.fromJson(value.data)));
      }
    }).catchError((error) {
      if (kDebugMode) {
        emit(GetSuggestedDataErrorState());
        print("error");
       // print(error);
      }

    });
  }



}
