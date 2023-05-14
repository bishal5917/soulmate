part of 'message_cubit.dart';

enum MessageStatus {
  initial,
  starting,
  sending,
  sent,
  fetchingMessages,
  fetchingMessageSuccess,
  error
}

class MessageState extends Equatable {
  final MessageStatus? status;
  final String? message;
  final List<MessageRequestModel>? messageRequestModel;

  const MessageState({
    this.status = MessageStatus.starting,
    this.message,
    this.messageRequestModel,
  });

  @override
  List<Object?> get props => [status, message];

  MessageState copyWith({
    MessageStatus? status,
    String? message,
    List<MessageRequestModel>? messageRequestModel,
  }) {
    return MessageState(
      status: status ?? this.status,
      message: message ?? this.message,
      messageRequestModel: messageRequestModel ?? this.messageRequestModel,
    );
  }
}

class MessageInitial extends MessageState {}
