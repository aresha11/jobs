import 'package:amitproject/0_model/saved_jobs_model.dart';
import 'package:amitproject/2_controller/database/shared/dio/dio_helper.dart';
import 'package:amitproject/utility/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import '../../utility/app_images.dart';
import '../database/local/shared_preference.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());

  List indexes=[];
  bool isSaved=false;

  DioHelper dioHelper =DioHelper();



  changeSavedIcon({required index}){
    bool found=false;

     for(int i=0;i<indexes.length;i++){
       if(index==indexes[i]){
         indexes.remove(index);
         found =true;

       }
     }
    if(found==false){
      indexes.add(index);
    }
   print(indexes);

    changeIconColor(index: index);
    emit(ChangeIconState());
  }
List<String>images=[AppImages.archiveWhite,AppImages.archiveWhite,AppImages.archiveWhite,AppImages.archiveWhite,AppImages.archiveWhite,AppImages.archiveWhite,AppImages.archiveWhite,AppImages.archiveWhite,AppImages.archiveWhite];
//String img=AppImages.archiveWhite;
  changeIconColor({index}){
    for(int i=0;i<indexes.length;i++){
      if(index==indexes[i]){
        images.add(AppImages.archiveBlue);
      }else{
        images.add(AppImages.archiveWhite);
      }
    }
  }









  //////////    addFavouriteJob.

  void addSavedJob({
    required String comp_id,

  }) {
    emit(LoadingSavedJobsState());
    print("post");
    dioHelper.postData(
        url:addFavouriteJopEndPoint,
        token:  SharedPreference.get(key: "token"),
        data: {
          "user_id":SharedPreference.get(key: "id"),
          "job_id":comp_id
        }).then((value) {

      if (value.statusCode ==200) {
        print("ss");
        emit(PostSavedJobsSuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(PostSavedJobsFailedState());
    });
  }




  ////////get all favourite jobs



  void getAllSavedJobs() {
    emit(GetSavedJobsLoadingState());
    print("hello");
    dioHelper.getData(
      url:getFavouriteJopEndPoint + SharedPreference.get(key: "id").toString(),
      token: SharedPreference.get(key:"token"),
    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetSavedJobsSuccessState(savedJobs: SavedJobs.fromJson(value.data)));
        print(SavedJobs.data[0].name.toString());

      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetSavedJobsFailedState());
    });
  }




  /////// delete all favorite jobs

  void deleteSavedJobs(jopId) {
    emit(DeleteSavedJobsLoadingState());
    dioHelper.deleteData(
      url:getFavouriteJopEndPoint+jopId,
      token: SharedPreference.get(key:"token"),
    ).then((value) {
      getAllSavedJobs();
      if (value.statusCode ==200) {
        emit(DeleteSavedJobsSuccessState());

      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(DeleteSavedJobsFailedState());
    });
  }


}




