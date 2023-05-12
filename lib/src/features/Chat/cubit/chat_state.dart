// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_cubit.dart';

enum ChatStatus { initial, starting, created, error }

class ChatState extends Equatable {
  ChatStatus? status;
  String? message;
  ChatState({this.status = ChatStatus.initial, this.message});

  factory ChatState.initial() {
    return ChatState(status: ChatStatus.initial, message: "");
  }

  @override
  List<Object> get props => [];

  ChatState copyWith({
    ChatStatus? status,
    String? message,
  }) {
    return ChatState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

class ChatInitial extends ChatState {}
