import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/models/contact.dart';

import '../chat/chat_page.dart';
import '../conversation/conversation_bloc.dart';
import '../conversation/conversation_states.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key, required this.contact, required this.position})
      : super(key: key);
  final Contact contact;
  final int position;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        await context.read<ConversationBloc>().startConversation(contact.uid);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (newContext) => BlocProvider.value(
                value: BlocProvider.of<ConversationBloc>(context),
                child: BlocBuilder<ConversationBloc, ConversationsState>(
                  builder: (context, state) {
                    state as ConversationsLoaded;
                    final conversation = state.emptyConversations.firstWhere(
                        (conversation) =>
                            conversation.contact.uid == contact.uid,
                        orElse: () => state.conversations.firstWhere(
                            (conversation) =>
                                conversation.contact.uid == contact.uid));
                    return ChatPage(
                      messages: conversation.messages,
                      contact: conversation.contact,
                      cid: conversation.id,
                    );
                  },
                ))));
      },
      leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
            contact.photo,
          )),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          contact.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(contact.lastTimeSeenFormate()),
    );
  }
}
