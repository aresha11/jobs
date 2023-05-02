part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class FirstFieldSuccess extends LoginState {}
class FirstFieldFailed extends LoginState {}
class SecondFieldSuccess extends LoginState {}
class SecondFieldFailed extends LoginState {}

//login states

class LoginSuccess extends LoginState {}
class LoginLoading extends LoginState {}
class LoginFailed extends LoginState {}
class GetDataSuccess extends LoginState {}
class GetDataFail extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginErrorState extends LoginState {}
class LoginSuccessState extends LoginState {
  LoginModel loginModel;
  LoginSuccessState({required this.loginModel});
}
