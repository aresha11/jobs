import 'package:amitproject/0_model/login_model.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../../utility/constants.dart';
import '../../../../../utility/routes.dart';
import '../../database/shared/dio/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Map map={};

  Color? color;

  bool first=false;
  bool second=false;
  checkFirstField(value,String field){
    if (value!="") {
      if(field=="first"){
        first=true;
        emit(FirstFieldSuccess());
      }else{
        second=true;
        emit(SecondFieldSuccess());
      }
    }
    else{
      if(field=="first"){
         first=false;
         emit(FirstFieldFailed());
      }else
        {
          second=false;
          emit(SecondFieldFailed());
        }
    }
  }
  DioHelper dioHelper=DioHelper();

  void postLogin({

    required String password,
    required String email,
    required context,

  }) {
    emit(LoginLoadingState());
    dioHelper.postData(
        url:loginEndPoint,
        data: {
      'password': password,
      'email': email,
    }).then((value) {
      if (value.statusCode ==200) {
       // emit(LoginSuccessState(loginModel: LoginModel.fromJson(value.data)));
       // print(LoginModel.fromJson(value.data));
        map.addAll(value.data);
        SharedPreference.put(key: "token", value:map["token"]);
        SharedPreference.put(key: "id", value:map["user"]["id"]);
        SharedPreference.put(key: "name", value:map["user"]["name"]);
        SharedPreference.put(key: "email", value:map["user"]["email"]);
        SharedPreference.put(key: "loggedIn", value:"true");
        Navigator.pushNamedAndRemoveUntil(context,  AppRoutes.homeLayoutRoute, (route) => false);
        // flutterToast(
        //   msg: 'Loged in Successfully',
        //   color: Colors.green,
        // );
      }
    }).catchError((error) {
      // flutterToast(
      //   msg: 'Email or Password is Wrong',
      //   color: Colors.red,
      // );
      if (kDebugMode) {
        print(error);
      }
      emit(LoginErrorState());
    });
  }















































  // FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  //
  // GoogleSignIn googleSignIn=GoogleSignIn();
  //
  // UserModel registerModel=UserModel();
  //
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //
  // loginByEmailAndPassword({required String email, required String password,required context}) async {
  //   UserCredential credential =
  //   await firebaseAuth.signInWithEmailAndPassword(
  //       email: email, password: password);
  //   firebaseFirestore.collection('user').doc(credential.user!.uid).get().then((value) {
  //     Navigator.of(context).pushNamed(AppRoutes.homeLayoutRoute);
  //     emit(LoginSuccess());
  //     emit(LoginLoading());
  //     userModel= UserModel.fromMap( (value.data()) as Map<String, dynamic>);
  //     SharedPreference.put(key: "userName", value: userModel.username.toString());
  //     SharedPreference.put(key: "photoUrl", value: userModel.photoUrl.toString());
  //     SharedPreference.put(key: "email", value: userModel.email.toString());
  //     SharedPreference.put(key: "bio", value: userModel.bio.toString());
  //     SharedPreference.put(key: "phoneNumber", value: userModel.phoneNumber.toString());
  //     SharedPreference.put(key: "about", value: userModel.about.toString());
  //     SharedPreference.put(key: "address", value: userModel.address.toString());
  //
  //
  //     print("Hello ${SharedPreference.get(key: "userName")}");
  //     emit(GetDataSuccess());
  //     if (kDebugMode) {
  //       print(value.data());
  //     }
  //   }).catchError((error){
  //     emit(GetDataFail());
  //   });
  // }


}
