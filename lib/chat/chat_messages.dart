import 'package:flutter/material.dart';
import 'package:telegram_clone/chat/widgets/bubble_message.dart';

import '../models/message.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({Key? key, required this.messages}) : super(key: key);
  final List<Message> messages;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        reverse: true,
        itemBuilder: (context, position) {
          bool isFinalMessage = verifyIsFinalMessage(position);
          if (position == 0) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BubbleMessage(
                    message: messages[position],
                    isFinalMessage: isFinalMessage),
                const SizedBox(
                  height: 60,
                ),
              ],
            );
          } 
          if (position == messages.length - 1) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                  const SizedBox(
                  height: 30,
                ),
                BubbleMessage(
                    message: messages[position],
                    isFinalMessage: isFinalMessage),
              ],
            );
          }
          return BubbleMessage(
              message: messages[position], isFinalMessage: isFinalMessage);
        });
  }

  bool verifyIsFinalMessage(int position) {
    if (position == 0) {
      return true;
    } else  {
      if (messages[position - 1].isMine == messages[position].isMine) {
        return false;
      }
      return true;
    }
  }
}
