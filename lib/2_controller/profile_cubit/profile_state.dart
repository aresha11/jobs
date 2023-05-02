part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}


class PicImageSuccessState extends ProfileState {}
class PicImageSuccessStorageState extends ProfileState {}
class PicImageSuccessDownloadStorageState extends ProfileState {}
class UpdateProfileSuccessState extends ProfileState {}
class UpdateProfileErrorState extends ProfileState {}
class GetProfileSuccessState extends ProfileState {}
class GetProfileErrorState extends ProfileState {}



class LoadingState extends ProfileState {}
class EditProfileBioAddressMobileSuccessState extends ProfileState {
  EditProfileBioAddressMobileModel editProfileBioAddressMobileModel;
  EditProfileBioAddressMobileSuccessState({required this.editProfileBioAddressMobileModel});
}
class EditProfileBioAddressMobileFailedState extends ProfileState {}



