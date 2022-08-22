import 'package:telegram_clone/models/message.dart';

import 'contact.dart';

class Conversation {
  String id;
  List<Message> messages;
  Contact contact;
  int unreadMessages;

  Conversation({required this.id, required this.messages, required this.contact,  required this.unreadMessages});

  factory Conversation.fromFirebase(
      {required String uid, required String id, required Map messagesMap, required Contact c, required int unreadMessages }) {
     List<Message> messages = [];
    messagesMap.forEach(
      (key, value) {
        messages.add(Message(
            text: value['texto'],
            isMine: value['uid'] == uid,
            dateTime: DateTime.parse(value['datetime']),
            messageId: key));
      },
    );

    return Conversation(id: id, messages: messages.reversed.toList(), contact: c, unreadMessages: unreadMessages);
  }

  @override
  String toString() {
    return "id: $id, messages: $messages";
  }
}