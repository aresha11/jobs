part of 'saved_cubit.dart';

@immutable
abstract class SavedState {}

class SavedInitial extends SavedState {}
class ChangeIconState extends SavedState {}

////// post favourite

class LoadingSavedJobsState extends SavedState {}
class PostSavedJobsSuccessState extends SavedState {}
class PostSavedJobsFailedState extends SavedState {}

///// get Favourite

class GetSavedJobsLoadingState extends SavedState {}
class GetSavedJobsSuccessState extends SavedState {
  SavedJobs savedJobs;
  GetSavedJobsSuccessState({required this.savedJobs});
}
class GetSavedJobsFailedState extends SavedState {}

///// delete favotite

class DeleteSavedJobsLoadingState extends SavedState {}
class DeleteSavedJobsSuccessState extends SavedState {}
class DeleteSavedJobsFailedState extends SavedState {}