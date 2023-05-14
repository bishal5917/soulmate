// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_cubit.dart';

enum ChatStatus { initial, starting, created, error }

class ChatState extends Equatable {
  final ChatStatus? status;
  final String? message;
  const ChatState({this.status = ChatStatus.starting, this.message});

  @override
  List<Object?> get props => [status, message];

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
