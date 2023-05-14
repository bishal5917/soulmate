// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_cubit.dart';

enum ChatStatus {
  initial,
  starting,
  created,
  fetchingConversation,
  fetchingConversationSuccess,
  error
}

class ChatState extends Equatable {
  final ChatStatus? status;
  final String? message;
  final List<ConversationRequestModel>? convoRequestModel;
  const ChatState(
      {this.status = ChatStatus.starting,
      this.message,
      this.convoRequestModel});

  @override
  List<Object?> get props => [status, message];

  ChatState copyWith(
      {ChatStatus? status,
      String? message,
      List<ConversationRequestModel>? convoRequestModel}) {
    return ChatState(
        status: status ?? this.status,
        message: message ?? this.message,
        convoRequestModel: convoRequestModel ?? this.convoRequestModel);
  }
}

class ChatInitial extends ChatState {}
