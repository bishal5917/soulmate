import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/Message/Repository/message_repository.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final MessageRepository _messageRepository;

  MessageCubit({required MessageRepository messageRepository})
      : _messageRepository = messageRepository,
        super(const MessageState());

  final TextEditingController _messageInputController = TextEditingController();

  TextEditingController get messageInputController => _messageInputController;

  Future<void> sendMessages(String conversationId, String senderId,
      String message, String sentTime) async {
    emit(
      state.copyWith(
          status: MessageStatus.sending, message: "sending message ... "),
    );
    try {
      await _messageRepository.sendMessage(
          conversationId, senderId, messageInputController.text, "sat 16 Jun");

      emit(state.copyWith(status: MessageStatus.error, message: "sent"));
    } catch (err) {
      consolelog(err.toString());
      emit(
          state.copyWith(status: MessageStatus.error, message: err.toString()));
    }
  }
}
