import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:telegram_clone/models/message.dart';

import 'triangle_bubble.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage(
      {Key? key, required this.message, required this.isFinalMessage})
      : super(key: key);
  final Message message;
  final bool isFinalMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: isFinalMessage ?  18.0 : 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            message.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          message.isMine
              ? const SizedBox.shrink()
              : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: 9,
                      width: 9,
                      decoration: BoxDecoration(
                          color: isFinalMessage
                              ? Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer
                              : Colors.transparent),
                    ),
                  ),
                ),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: message.isMine
                    ? Theme.of(context).colorScheme.onSecondaryContainer
                    : Theme.of(context).colorScheme.onTertiaryContainer,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15.5),
                  topRight: const Radius.circular(15.5),
                  bottomLeft: message.isMine
                      ? const Radius.circular(15.5)
                      : Radius.zero,
                  bottomRight: message.isMine
                      ? Radius.zero
                      : const Radius.circular(15.5),
                )),
            child: Text(
              message.text,
              maxLines: 1000,
            ),
          ),
          message.isMine
              ? ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                        color: isFinalMessage
                            ? Theme.of(context).colorScheme.onSecondaryContainer
                            : Colors.transparent),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
