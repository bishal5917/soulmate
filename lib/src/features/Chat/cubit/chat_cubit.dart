import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/Chat/Repository/chat_repository.dart';
import 'package:soulmate/src/features/Chat/models/conversation_request_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;

  ChatCubit({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(const ChatState());

  //required data to create a chat
  //userid,friendId,image,friendname

  Future<void> createChat(String userId, String anotherUserId) async {
    emit(
      state.copyWith(
          status: ChatStatus.starting, message: "Creating a chat !!!"),
    );
    try {
      if (await _chatRepository.checkChatExists(userId, anotherUserId) ==
          false) {
        await _chatRepository.createChat(userId, anotherUserId);
        emit(state.copyWith(
          status: ChatStatus.created,
          message: "Added to chat !!!",
        ));
      } else {
        emit(state.copyWith(
            status: ChatStatus.error, message: "Already Your Chat !!!"));
      }
    } catch (err) {
      consolelog(err.toString());
      emit(state.copyWith(status: ChatStatus.error, message: err.toString()));
    }
  }

  Future<void> retrieveConversations(String userId) async {
    emit(
      state.copyWith(
          status: ChatStatus.fetchingConversation,
          message: "Getting Conversations ...",
          convoRequestModel: []),
    );
    try {
      final conversationList = await _chatRepository.getConvos(userId);
      emit(state.copyWith(
          status: ChatStatus.fetchingConversationSuccess,
          convoRequestModel: conversationList,
          message: "Getting Conversations ..."));
    } catch (err) {
      consolelog(err.toString());
      emit(state.copyWith(status: ChatStatus.error, message: err.toString()));
    }
  }
}
