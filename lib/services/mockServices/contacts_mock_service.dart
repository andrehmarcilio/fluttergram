import 'package:telegram_clone/models/contact.dart';

import '../../mock/mock.dart';

Future<List<Contact>> getContacts(String uid) async {
  List<Contact> listContacts = [];
  mock['usuarios'][uid]['contatos'].forEach((k, v) {
    listContacts.add(Contact(
        uid: k,
        name: v['nome'],
        photo: v['foto'],
        lastTimeSeen: DateTime.parse(v['vistoPorUltimo'])));
  });

  Future.delayed(const Duration(seconds: 1));
  return listContacts;
}

Future<Contact?> getContact(String uid, String contactId) async {
  Contact? contact;
  mock['usuarios'][uid]['contatos'].forEach((k, v) {
    if(k == contactId) {
   contact = Contact(
        uid: k,
        name: v['nome'],
        photo: v['foto'],
        lastTimeSeen: DateTime.parse(v['vistoPorUltimo']));
    }
  });

  Future.delayed(const Duration(seconds: 1));
  return contact;
}
