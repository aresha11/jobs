part of 'apply_job_cubit.dart';

@immutable
abstract class ApplyJobState {}

class ApplyJobInitial extends ApplyJobState {}
class ApplyJobFChangeIndexState extends ApplyJobState {}
class ApplyJobLoadingState extends ApplyJobState {}
class ApplyJobSuccessState extends ApplyJobState {}
class GetApplyJobSuccessState extends ApplyJobState {
  ApplyJobModel applyJobModel;
  GetApplyJobSuccessState({required this.applyJobModel});
}
class ApplyJobErrorState extends ApplyJobState {}
