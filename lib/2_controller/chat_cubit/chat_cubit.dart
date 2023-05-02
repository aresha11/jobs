import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/utility/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../0_model/chat_model.dart';
import '../../0_model/recent_jobs_model.dart';
import '../../utility/app_images.dart';
import '../database/shared/dio/dio_helper.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  var chats1=[];
  List<RecentJobsModel> chats=[];

DioHelper dioHelper=DioHelper();


  var sendIcon=AssetImage(AppImages.microphone);
  changIcon(String value){
    if(value!=""){
      sendIcon=AssetImage(AppImages.sendMessage);
    }else{
      sendIcon=AssetImage(AppImages.microphone);
    }


  }


//
//   void getChats(){
//
//
//     for(int i=1;i<=JobsModel.data!.length;i++){
//       dioHelper.getData(
//           queryParameters:  {
//             "user_id":SharedPreference.get(key: "id").toString(),
//             "comp_id":i
//           },
//           url: chatsEndPoint,
//           token: SharedPreference.get(key: "token")
//       ).then((value) {
//         chats1= value.data['data'];
//         if(chats1.length!=0){
//           allChats=JobsModel.fromJson(JobsModel.data![i]);
//           print(allChats);
//         }
//         print(chats.length);
//
//       },);
//
//     }
// }









  void userSentMessage({

    required String message,
    required String comp_id,
    required context,

  }) {
    emit(SentMessageLoadingState());
    dioHelper.postData(

        url:userSentMessageEndPoint,
        data: {
          "massage":message,
          "user_id":SharedPreference.get(key: "id"),
          "comp_id":comp_id
        }).then((value) {
      if (value.statusCode ==500) {
        print ("sent");
        emit(SentMessageSuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(SentMessageErrorState());
    });
  }



  void getAllMessages(compId) {
    emit(GetMessageLoadingState());
    dioHelper.getData(
      queryParameters: {
        "user_id":SharedPreference.get(key: "id").toString(),
        "comp_id":compId
      },
      url:chatsEndPoint,
      token: SharedPreference.get(key:"token"),
    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetMessageSuccessState(chatModel: ChatModel.fromJson(value.data)));
        print(ChatModel.data![1].massage.toString());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetMessageErrorState());
    });
  }

}
