part of 'complete_profile_cubit.dart';

@immutable
abstract class CompleteProfileState {}

class CompleteProfileInitial extends CompleteProfileState {}
class ChangePercentageState extends CompleteProfileState {}
class CheckIfCompletedState extends CompleteProfileState {}
class EducationLoadingState extends CompleteProfileState {}
class EducationSuccessState extends CompleteProfileState {}
class EducationErrorState extends CompleteProfileState {}
class ExperienceErrorState extends CompleteProfileState {}
class ExperienceSuccessState extends CompleteProfileState {}
class ExperienceLoadingState extends CompleteProfileState {}
class LoadingState extends CompleteProfileState {}
class EditProfileBioAddressMobileSuccessState extends CompleteProfileState {
  EditProfileBioAddressMobileModel editProfileBioAddressMobileModel;
  EditProfileBioAddressMobileSuccessState({required this.editProfileBioAddressMobileModel});
}
class EditProfileBioAddressMobileFailedState extends CompleteProfileState {}

class AddPortfolioLoadingState extends CompleteProfileState {}
class AddPortfolioSuccessState extends CompleteProfileState {}
class AddPortfolioFailedInitial extends CompleteProfileState {}

