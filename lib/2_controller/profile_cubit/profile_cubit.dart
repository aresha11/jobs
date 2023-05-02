import 'package:amitproject/0_model/edit_profile_bio_address_mobile_model.dart';
import 'package:amitproject/0_model/get_user_information_model.dart';
import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:amitproject/2_controller/database/shared/dio/dio_helper.dart';
import 'package:amitproject/utility/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


DioHelper dioHelper=DioHelper();


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

      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(EditProfileBioAddressMobileFailedState());
    });
  }

  GetUserInformationModel getUserInformationModel=GetUserInformationModel();

  void getProfileInformation() {
    emit(LoadingDataState());
    dioHelper.getData(

      url:getProfileInfo+SharedPreference.get(key: "id").toString(),
      token: SharedPreference.get(key: "token") ,
    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetDataSuccessState());
        getUserInformationModel=value.data;
        print(getUserInformationModel.name.toString());
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetDataFailedState());
    });
  }













  // FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // ImagePicker imagePicker = ImagePicker();
  // UserModel profileModel = UserModel();
  // XFile? userImage;
  // String? photoUrl;
  //
  // image(String camera,
  //     UserModel user,) async {
  //   if (camera == "camera") {
  //     userImage = await imagePicker.pickImage(source: ImageSource.camera);
  //     emit(PicImageSuccessState());
  //     await firebaseStorage
  //         .ref()
  //         .child("images/")
  //         .child("${user.id}.jpg")
  //         .putFile(File(userImage!.path));
  //     emit(PicImageSuccessStorageState());
  //     firebaseStorage
  //         .ref()
  //         .child("images/")
  //         .child("${user.id}.jpg")
  //         .getDownloadURL()
  //         .then((value) {
  //       firebaseFirestore
  //           .collection('user')
  //           .doc(user.id)
  //           .update({"photoUrl": value});
  //       firebaseFirestore.collection('user').doc(user.id).get().then((value) {
  //         profileModel =
  //             UserModel.fromMap((value.data()) as Map<String, dynamic>);
  //         SharedPreference.put(key: 'photoUrl', value: profileModel.photoUrl);
  //         emit(PicImageSuccessDownloadStorageState());
  //       });
  //       //CacheHelper.put(key: 'photoUrl', value: user.photoUrl);
  //
  //     }).catchError((onError) {
  //       throw (onError);
  //     });
  //
  //     return userImage!.readAsBytes();
  //   } else {
  //     userImage = await imagePicker.pickImage(source: ImageSource.gallery);
  //     await firebaseStorage
  //         .ref()
  //         .child("images/")
  //         .child("${user.id}.jpg")
  //         .putFile(File(userImage!.path));
  //     firebaseStorage
  //         .ref()
  //         .child("images/")
  //         .child("${user.id}.jpg")
  //         .getDownloadURL()
  //         .then((value) {
  //       firebaseFirestore
  //           .collection('user')
  //           .doc(user.id)
  //           .update({"photoUrl": value});
  //       firebaseFirestore.collection('user').doc(user.id).get().then((value) {
  //         profileModel =
  //             UserModel.fromMap((value.data()) as Map<String, dynamic>);
  //         SharedPreference.put(key: 'photoUrl', value: profileModel.photoUrl);
  //         emit(PicImageSuccessDownloadStorageState());
  //       });
  //     }).catchError((onError) {
  //       throw (onError);
  //     });
  //     return userImage!.readAsBytes();
  //   }
  // }
  //
  //
  // editProfile(
  //     {String? name, String? bio, String? address, String? phoneNumber, required UserModel user}) {
  //   firebaseFirestore
  //       .collection('user')
  //       .doc(user.id)
  //       .update(
  //       {"username": name,
  //         "bio": bio,
  //         "address": address,
  //         "phoneNumber": phoneNumber,
  //       }).then((value) {
  //       emit(UpdateProfileSuccessState());
  //   }).catchError((onError){
  //     if (kDebugMode) {
  //       print(onError);
  //     }
  //     emit(UpdateProfileErrorState());
  //   });
  //   firebaseFirestore.collection('user').doc(user.id).get().then((value) {
  //     profileModel = UserModel.fromMap((value.data()) as Map<String, dynamic>);
  //     emit(GetProfileSuccessState());
  //   }).catchError((onError){
  //     if (kDebugMode) {
  //       print(onError);
  //     }
  //     emit(GetProfileErrorState());
  //   });
  //}













}
