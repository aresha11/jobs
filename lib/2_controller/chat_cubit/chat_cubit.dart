import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/utility/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../0_model/chat_model.dart';
import '../../0_model/recent_jobs_model.dart';
import '../../0_model/suggested_jobs_model.dart';
import '../../utility/app_images.dart';
import '../database/shared/dio/dio_helper.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());



DioHelper dioHelper=DioHelper();


  var sendIcon=AssetImage(AppImages.microphone);
  changIcon(String value){
    if(value!=""){
      sendIcon=AssetImage(AppImages.sendMessage);
      emit(SendState());
    }else{
      sendIcon=AssetImage(AppImages.microphone);
      emit(NoMessageState());
    }


  }



//   void getChats(){
//
//
//     for(int i=1;i<=SuggestedJobsModel.data.length;i++){
//       dioHelper.getData(
//           queryParameters:  {
//             "user_id":SharedPreference.get(key: "id").toString(),
//             "comp_id":1
//           },
//           url: chatsEndPoint,
//           token: SharedPreference.get(key: "token")
//       ).then((value) {
//         chats1= value.data['data'];
//         if(chats1.length!=0){
//          var allChats=SuggestedJobsModel.fromJson(value.data![i]);
//           print("allChats");
//           print(allChats);
//         }
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
        token: SharedPreference.get(key: "token"),
        data: {
          "massage":message,
          "user_id":SharedPreference.get(key: "id"),
          "comp_id":comp_id
        }).then((value) {
      if (value.statusCode ==200) {
        getAllMessages(comp_id);
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
    ChatModel.data.clear();
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
        //print("");
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetMessageErrorState());
    });
  }

}
