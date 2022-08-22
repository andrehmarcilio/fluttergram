import 'package:telegram_clone/authentication/repository/user_repository.dart';

import '../models/conversation.dart';
import '../services/mockServices/chat_mock_service.dart'
    as conversation_service;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'conversation_states.dart';

class ConversationBloc extends Cubit<ConversationsState> {
  ConversationBloc(this._userRepository) : super(ConversationsInitialState());
  final UserRepository _userRepository;

  getConversation() async {
    emit(ConversationsLoading());
    try {
      Map<String, List<Conversation>> conversationsMap =
          await conversation_service
              .getConversations(await _userRepository.getToken());
      List<Conversation> conversations = conversationsMap['conversation']!;
      List<Conversation> emptyconversations =
          conversationsMap['empty-conversations']!;
      if (conversations.isNotEmpty) {
        emit(ConversationsLoaded(conversations,
            emptyConversations: emptyconversations));
      } else {
        emit(ConversationsEmpty());
      }
    } catch (e) {
      emit(ConversationsError(e.toString()));
    }
  }

  updateUreadMessages(String cid) async {
    await conversation_service.updateUnreadMessages(
        await _userRepository.getToken(), cid);
    await _updateMessages();
  }

  writeNewMessage(String cid, String text) async {
    await conversation_service.writeNewMessage(
        await _userRepository.getToken(), cid, text);
    await _updateMessages();
  }

  Future<void> startConversation(String contactid) async {
    await conversation_service.startConversation(
        await _userRepository.getToken(), contactid);
    await _updateMessages();
    return;
  }

  Future<void> _updateMessages() async {
    Map<String, List<Conversation>> conversationsMap =
        await conversation_service
            .getConversations(await _userRepository.getToken());
    List<Conversation> conversations = conversationsMap['conversation']!;
    List<Conversation> emptyconversations =
        conversationsMap['empty-conversations']!;

    emit(ConversationsLoaded(conversations,
        emptyConversations: emptyconversations));
    return;
  }


}
