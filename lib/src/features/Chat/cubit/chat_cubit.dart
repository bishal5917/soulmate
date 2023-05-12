import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/Chat/Repository/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;

  ChatCubit({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(ChatState.initial());

  //required data to create a chat
  //userid,friendId,image,friendname

  Future<void> createChat(String userId, String anotherUserId,
      String anotherUserName, String anotherUserImage) async {
    emit(
      state.copyWith(status: ChatStatus.starting, message: "Fetching Started"),
    );
    try {
      final response = await _chatRepository.createChat(
          userId, anotherUserId, anotherUserName, anotherUserImage);
      emit(state.copyWith(
        status: ChatStatus.created,
        message: "Added to chat !!!",
      ));
    } catch (err) {
      consolelog(err.toString());
      emit(state.copyWith(status: ChatStatus.error, message: err.toString()));
    }
  }
}
