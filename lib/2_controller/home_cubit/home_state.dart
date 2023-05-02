part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class LoadingDataState extends HomeState {}
class GetDataErrorState extends HomeState {}
class GetDataSuccessState extends HomeState {
  RecentJobsModel jobsModel;
  GetDataSuccessState({required this.jobsModel});
}
//class GetSuggestedDataSuccessState extends HomeState {}














class LoadingSuggestedDataState extends HomeState {}


class GetSuggestedDataSuccessState extends HomeState {
  SuggestedJobsModel suggestedJobsModel;
  GetSuggestedDataSuccessState({required this.suggestedJobsModel});
}
class GetSuggestedDataErrorState extends HomeState {}
