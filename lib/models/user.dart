import 'package:telegram_clone/models/contact.dart';

class User {
  String uid;
  String name;
  String photo;
  List<Contact> contacts;

  User({
    required this.uid,
    required this.name,
    required this.photo,
    required this.contacts,
  });

  factory User.fromJson({String? userId , required Map userMap}) {
    List<Contact> contacts = [];
    final String uid = userId ?? userMap['uid'];
    final String name = userMap['nome'];
    final String photo = userMap['foto'];
     userMap['contatos'].forEach((contactId ,contactMap) {
       contacts.add(Contact.fromMap(keyuid: contactId, contactMap: contactMap));
     });

    return User(uid: uid, name: name, photo: photo, contacts: contacts);
  }

  factory User.fromRepository({required Map userMap}) {
    List<Contact> contacts = [];
    final String uid = userMap['uid'];
    final String name = userMap['nome'];
    final String photo = userMap['foto'];
     userMap['contatos'].forEach((contactMap) {
       contacts.add(Contact.fromMap(contactMap: contactMap));
     });

    return User(uid: uid, name: name, photo: photo, contacts: contacts);
  }

  Map toJson() {
    return {'uid': uid, 'nome': name, 'foto': photo, 'contatos' : contacts.map((contact) => contact.toMap()).toList()};
  }

  @override
  String toString() {
    return 'uid: $uid, nome : $name, foto: $photo, contatos: $contacts';
  }

  
}
