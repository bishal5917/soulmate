import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/Message/Repository/message_repository.dart';
import 'package:soulmate/src/features/Message/models/message_request_model.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final MessageRepository _messageRepository;

  MessageCubit({required MessageRepository messageRepository})
      : _messageRepository = messageRepository,
        super(const MessageState());

  final TextEditingController _messageInputController = TextEditingController();

  TextEditingController get messageInputController => _messageInputController;

  Future<void> sendMessages(String conversationId, String senderId) async {
    emit(
      state.copyWith(
          status: MessageStatus.sending, message: "sending message ... "),
    );
    try {
      if (messageInputController.text.isNotEmpty) {
        await _messageRepository.sendMessage(conversationId, senderId,
            messageInputController.text, "sat 16 Jun");

        emit(state.copyWith(status: MessageStatus.sent, message: "sent"));
      }
      emit(
        state.copyWith(status: MessageStatus.initial, message: "initial"),
      );
    } catch (err) {
      consolelog(err.toString());
      emit(
          state.copyWith(status: MessageStatus.error, message: err.toString()));
    }
  }

  Future<void> retrieveMessages(String conversationId) async {
    emit(
      state.copyWith(
          status: MessageStatus.fetchingMessages,
          message: "Getting Messages ...",
          messageRequestModel: []),
    );
    try {
      final messageList = await _messageRepository.getMessages(conversationId);
      emit(state.copyWith(
          status: MessageStatus.fetchingMessageSuccess,
          messageRequestModel: messageList,
          message: "Messages fetched ..."));
    } catch (err) {
      consolelog(err.toString());
      emit(state.copyWith(
          status: MessageStatus.error,
          message: err.toString(),
          messageRequestModel: []));
    }
  }

  void resetControllers() {
    _messageInputController.clear();
  }
}
