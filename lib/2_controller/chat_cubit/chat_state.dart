part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}



class SendState extends ChatState {}
class NoMessageState extends ChatState {}






//////// user sent message
class SentMessageLoadingState extends ChatState {}
class SentMessageErrorState extends ChatState {}
class SentMessageSuccessState extends ChatState {}


///// get all message


class GetMessageLoadingState extends ChatState {}
class GetMessageErrorState extends ChatState {}
class GetMessageSuccessState extends ChatState {
  ChatModel chatModel;

  GetMessageSuccessState({required this.chatModel});
}
