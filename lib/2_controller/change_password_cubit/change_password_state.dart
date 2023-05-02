part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}
class LoadingState extends ChangePasswordState {}
class ChangePasswordSuccessState extends ChangePasswordState {}
class ChangePasswordFailedState extends ChangePasswordState {}
