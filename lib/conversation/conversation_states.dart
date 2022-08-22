import '../models/conversation.dart';

abstract class ConversationsState {} 

class ConversationsInitialState extends ConversationsState {}

class ConversationsLoading extends ConversationsState {}

class ConversationsLoaded extends ConversationsState {
  List<Conversation> conversations; 
  List<Conversation> emptyConversations; 

  ConversationsLoaded(this.conversations, {required this.emptyConversations});
}

class ConversationsEmpty extends ConversationsState {}

class ConversationsError extends ConversationsState {
  String errorMessage = "Unknow Error";
  ConversationsError(this.errorMessage);
}

