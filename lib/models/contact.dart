import 'package:telegram_clone/utils/date_time_formater.dart';

class Contact {
  String uid;
  String name;
  String photo;
  DateTime lastTimeSeen;

  Contact(
      {required this.uid,
      required this.name,
      required this.photo,
      required this.lastTimeSeen});

  Contact.fromMap({String? keyuid ,required Map contactMap})
      : uid = keyuid ?? contactMap['uid'],
        name = contactMap['nome'],
        photo = contactMap['foto'],
        lastTimeSeen = DateTime.parse(contactMap['vistoPorUltimo']);
  
  Map toMap() {
    return {
      'uid' : uid,
      'nome' : name,
      'foto': photo,
      'vistoPorUltimo': lastTimeSeen.toString()
    };
  }


  String lastTimeSeenFormate() {
    String time = '';
    if(lastTimeSeen.day == DateTime.now().day) {
      time = ' às ${lastTimeSeen.hour}:${lastTimeSeen.minute}';
    } else if(lastTimeSeen.day == DateTime.now().day - 1) {
       time = ' ontem, ${lastTimeSeen.hour}:${lastTimeSeen.minute}';
    } else {
       time = ' ${formateDateTime(lastTimeSeen)}, ${lastTimeSeen.hour}:${lastTimeSeen.minute}';
    }
    return 'visto$time';
  } 

  @override
  String toString() {
    return "{uid: $uid, name: $name, photo: $photo, lastTime: $lastTimeSeen}";
  }
}
