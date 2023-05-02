part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial    extends RegisterState {}
class FirstFieldSuccess  extends RegisterState {}
class FirstFieldFailed   extends RegisterState {}
class SecondFieldSuccess extends RegisterState {}
class SecondFieldFailed  extends RegisterState {}
class ThirdFieldSuccess extends RegisterState {}
class ThirdFieldFailed  extends RegisterState {}

//register state

class RegisterLoadingState  extends RegisterState {}
class RegisterSuccessState  extends RegisterState {}
class RegisterErrorState  extends RegisterState {}