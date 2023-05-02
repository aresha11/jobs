import 'package:amitproject/2_controller/database/shared/dio/dio_helper.dart';
import 'package:amitproject/utility/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../database/local/shared_preference.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());


DioHelper dioHelper=DioHelper();

  void changePassword({
    required String password,
  }) {
    emit(LoadingState());

    dioHelper.putData(
      data: {
        "name":SharedPreference.get(key: "name"),
        "password":password,
      },
      url:changePasswordEndPoint+SharedPreference.get(key: "id").toString(),
      token: SharedPreference.get(key: "token") ,
    ).then((value) {
      if (value.statusCode ==200) {
        print("Dddddd");
        emit(ChangePasswordSuccessState());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(ChangePasswordFailedState());
    });
  }





}
