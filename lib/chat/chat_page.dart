import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/conversation/conversation_bloc.dart';

import '../models/contact.dart';
import '../models/message.dart';
import 'chat_messages.dart';

class ChatPage extends StatefulWidget {
  final List<Message> messages;
  final Contact contact;
  final String cid;
  const ChatPage({Key? key, required this.messages, required this.contact, required this.cid})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  bool isSendInconVisible = false;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: Row(children: [
          const SizedBox(
            width: 8,
          ),
          const BackButton(),
          CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                widget.contact.photo,
              )),
        ]),
        title: Text(
          widget.contact.name,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              const SizedBox(width: 7),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              )
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ChatMessages(
              messages: widget.messages,
            ),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: Material(
                  color: Theme.of(context).colorScheme.onTertiary,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions_outlined)),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              isSendInconVisible = value.isNotEmpty;
                            });
                          },
                          controller: _messageController,
                          decoration: const InputDecoration(
                              hintText: 'Mensagem', border: InputBorder.none),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: isSendInconVisible ? 1.0 : 0.0,
                        child: IconButton(
                            splashRadius: 22,
                            onPressed: isSendInconVisible ? () {
                              context.read<ConversationBloc>().writeNewMessage(widget.cid, _messageController.text);
                              setState(() {
                                _messageController.text = '';
                                isSendInconVisible = false;
                              });
                            } : null,
                            icon: Icon(
                              Icons.send,
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
