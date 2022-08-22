class Message {
  String text;
  bool isMine;
  DateTime dateTime;
  String messageId;

  Message(
      {required this.text,
      required this.isMine,
      required this.dateTime,
      required this.messageId});

  @override
  String toString() {
    return "text: $text, isMine: $isMine, dateTime: $dateTime, messageId: $messageId";
  }
}
