import 'package:amitproject/2_controller/database/shared/dio/dio_helper.dart';
import 'package:amitproject/utility/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../utility/routes.dart';
import '../../database/local/shared_preference.dart';



part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  DioHelper dioHelper=DioHelper();

  Map map={};

  String passwordState="initial";

  bool first=false;
  bool second=false;
  bool third=false;

  checkField(value,String field){
    if (value!="") {
      if(field=="first"){
        first=true;
        emit(FirstFieldSuccess());
      }else if(field=="second"){
        second=true;
        emit(SecondFieldSuccess());
      }else{
        third=true;
        emit(ThirdFieldSuccess());
      }
    }
    else{
      if(field=="first"){
        first=false;
        emit(FirstFieldFailed());
      }else if(field=="second"){
        second=false;
        emit(SecondFieldFailed());
      }else{
        third=false;
        emit(ThirdFieldFailed());
      }

    }
  }

  checkPasswordField(String value){
    var length=value.split("");
    if(length.length<8){
      passwordState="notAccepted";
    }else{
      passwordState="Accepted";
    }
  }

  void registerFunction({

    required String password,
    required String email,
    required String name,
    required context,

  }) {
    emit(RegisterLoadingState());
    dioHelper.postData(
        url:registerEndPoint,
        data: {
          "name":name,
          'email': email,
          'password': password,
        }).then((value) {
          print(value.statusCode);
      if (value.statusCode ==200) {
         emit(RegisterSuccessState());
        // print(LoginModel.fromJson(value.data));
        map.addAll(value.data);
         SharedPreference.put(key: "token", value:map["token"]);
         SharedPreference.put(key: "id", value:map["profile"]["user_id"]);
         SharedPreference.put(key: "name", value:map["profile"]["name"]);
         SharedPreference.put(key: "email", value:map["profile"]["email"]);
         SharedPreference.put(key: "loggedIn", value:"true");
         SharedPreference.put(key: "loginEmail", value: email);
         Navigator.pushNamedAndRemoveUntil(context,  AppRoutes.interestedWorkScreenRoute, (route) => false);
        // flutterToast(
        //   msg: 'Loged in Successfully',
        //   color: Colors.green,
        // );
      }
    }).catchError((error) {
      print(error);
      // flutterToast(
      //   msg: 'Email or Password is Wrong',
      //   color: Colors.red,
      // );
      if (kDebugMode) {
        print(error);
      }
      emit(RegisterErrorState());
    });
  }









  // Future postRegister({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required String phoneNumber,
  //   required String gender,
  // }) async {
  //   emit(RegisterLoadingState());
  //   DioHelper.postData(url: registerEndPoint, data: {
  //     "email": email,
  //     "password": password,
  //     "name": name,
  //     "gender": gender,
  //     "phoneNumber": phoneNumber,
  //   }).then((value) {
  //     if (value.statusCode == 200) {
  //       print(value.statusCode);
  //       flutterToast(
  //         msg: 'Registered Successfully',
  //         color: Colors.green,
  //
  //       );
  //       emit(RegisterSuccessState());
  //     }
  //   }).catchError((error){
  //     if (kDebugMode) {
  //       print(error);
  //     }
  //     emit(RegisterErrorState());
  //   });
  // }












  //
  // XFile? imagePath;
  //
  // ImagePicker imagePicker=ImagePicker();
  //
  // FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  //
  // FirebaseStorage firebaseStorage=FirebaseStorage.instance;
  //
  // GoogleSignIn googleSignIn=GoogleSignIn();
  //
  // UserModel registerModel=UserModel();
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //
  // registerByEmailAndPassword({required String email ,required String password,required String username,required context})async{
  //   UserCredential credential=await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  //   //registerModel.password=password;
  //   registerModel.email=email;
  //   registerModel.username=username;
  //   registerModel.id=credential.user!.uid ;
  //   firebaseFirestore.collection("user").doc(registerModel.id).set(registerModel.toMap())
  //       .then((value) {
  //     Navigator.of(context)
  //         .pushNamed(AppRoutes.interestedWorkScreenRoute);
  //          emit(RegisterSuccessState());
  //   })
  //       .catchError(onError);
  // }
  //
  // registerByGoogle({required context})async{
  //   googleSignIn.signOut();
  //   GoogleSignInAccount? googleSignInAccount = await  googleSignIn.signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount!.authentication;
  //   AuthCredential authCredential=GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken,accessToken: googleSignInAuthentication.accessToken);
  //   var user=await firebaseAuth.signInWithCredential(authCredential).then((value) {
  //     Navigator.of(context)
  //         .pushNamed(AppRoutes.interestedWorkScreenRoute);
  //   });
  //  // registerModel.password=googleSignInAccount.serverAuthCode;
  //   registerModel.email=googleSignInAccount.email;
  //   registerModel.username=googleSignInAccount.displayName;
  //   registerModel.id=googleSignInAccount.id;
  //   firebaseFirestore.collection("user").doc(registerModel.id).set(registerModel.toMap());
  // }




}
