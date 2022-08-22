import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/conversation/conversation_bloc.dart';
import 'package:telegram_clone/conversation/conversation_states.dart';
import 'package:telegram_clone/models/conversation.dart';
import 'package:telegram_clone/utils/date_time_formater.dart';

import '../../chat/chat_page.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key, required this.conversation, required this.position})
      : super(key: key);
  final Conversation conversation;
  final int position;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        context.read<ConversationBloc>().updateUreadMessages(conversation.id);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (newContext) => BlocProvider.value(
                value: BlocProvider.of<ConversationBloc>(context),
                child: BlocBuilder<ConversationBloc, ConversationsState>(
                  builder: (context, state) {
                    state as ConversationsLoaded;
                    return ChatPage(
                      messages: state.conversations[position].messages,
                      contact: state.conversations[position].contact,
                      cid: conversation.id,
                    );
                  },
                ))));
      },
      leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
            conversation.contact.photo,
          )),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          conversation.contact.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text.rich(
        TextSpan(style: const TextStyle(fontSize: 15.5), children: <InlineSpan>[
          TextSpan(
            text: conversation.messages.first.isMine
                ? 'Eu: '
                : conversation.contact.name + ': ',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          TextSpan(
            text: conversation.messages.first.text,
          )
        ]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            formateDateTime(conversation.messages.first.dateTime),
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 4,
          ),
          conversation.unreadMessages > 0
              ? Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary),
                  child: Text(conversation.unreadMessages.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.white)),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
