import 'package:telegram_clone/models/contact.dart';
import 'package:telegram_clone/models/conversation.dart';

import '../../mock/mock.dart';
import 'contacts_mock_service.dart';

Future<Map<String, List<Conversation>>> getConversations(String uid) async {
  List<Conversation> listConversation = [];
  List<Conversation> listEmptyConversation = [];
  Contact? contato;
  if (mock['conversas'][uid] != null) {
    mock['conversas'][uid].forEach((k, v) async {
      contato = await getContact(uid, k.substring(uid.length));
      if (v['mensagens'].length > 0) {
        listConversation.add(Conversation.fromFirebase(
            uid: uid,
            id: k,
            messagesMap: v['mensagens'],
            c: contato ??
                Contact(
                    uid: k.substring(uid.length),
                    name: "Unknow",
                    photo: 'https://randomuser.me/api/portraits/lego/1.jpg',
                    lastTimeSeen:
                        DateTime.now().subtract(const Duration(days: 4))),
            unreadMessages: v['nao-lidas']));
      } else {
        listEmptyConversation.add(Conversation.fromFirebase(
            uid: uid, id: k, messagesMap: {}, c: contato!, unreadMessages: 0));
      }
    });
  }
  return {
    'conversation': listConversation,
    'empty-conversations': listEmptyConversation
  };
}

Future updateUnreadMessages(String uid, String conversationId) async {
  mock['conversas'][uid][conversationId]['nao-lidas'] = 0;
}

Future writeNewMessage(String uid, String conversationId, String text) async {
  mock['conversas'][uid][conversationId]['mensagens'].addAll({
    '$uid$conversationId${DateTime.now()}': {
      "texto": text,
      "uid": uid,
      "datetime": DateTime.now().toString()
    }
  });
  final String otherUserId = conversationId.substring(uid.length);
  mock['conversas'][otherUserId][otherUserId + uid]['mensagens'].addAll({
    '$uid$conversationId${DateTime.now()}': {
      "texto": text,
      "uid": uid,
      "datetime": DateTime.now().toString()
    }
  });
  mock['conversas'][otherUserId][otherUserId + uid]['nao-lidas']++;
}

Future startConversation(String uid, String contactId) async {
  mock['conversas'][uid]
      .putIfAbsent('$uid$contactId', () => {'nao-lidas': 0, 'mensagens': {}});
  mock['conversas'][contactId]
      .putIfAbsent('$contactId$uid', () => {'nao-lidas': 0, 'mensagens': {}});
}
