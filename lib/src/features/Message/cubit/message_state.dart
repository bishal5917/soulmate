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
  // final List<ConversationRequestModel>? convoRequestModel;

  const MessageState({
    this.status = MessageStatus.starting,
    this.message,
    // this.convoRequestModel,
  });

  @override
  List<Object?> get props => [status, message];

  MessageState copyWith({
    MessageStatus? status,
    String? message,
    // List<ConversationRequestModel>? convoRequestModel,
  }) {
    return MessageState(
      status: status ?? this.status,
      message: message ?? this.message,
      // convoRequestModel: convoRequestModel ?? this.convoRequestModel,
    );
  }
}

class MessageInitial extends MessageState {}
