import 'package:telegram_clone/mock/authmock.dart';
import 'package:telegram_clone/mock/mock.dart';
import 'package:telegram_clone/models/user.dart';

Future<User> singin({required String user, required String password}) async {
  String? _uid;
 
  Map? userMap;
  for (var element in authMock['users']!) {
    if(user == element['user'] && password == element['password']) {
      _uid = element['uid'];
       userMap = mock['usuarios'][_uid];
    }
   }
   if(_uid != null) {
     await Future.delayed(const Duration(milliseconds: 700));
     return User.fromJson(userId: _uid, userMap: userMap!);
   }
   throw Exception('Usuário e/ou senha inválidos');
}


Future<User> createAccount({required String name,required String user, required String password}) async {
  String _uid = authMock['nextId'].toString();
  authMock['users'].add({"user" : user, "password": password, "uid": _uid});
  authMock['nextId']++;
  mock['usuarios'][_uid] = {"nome": name, "foto" : 'https://randomuser.me/api/portraits/lego/1.jpg', "contatos" : {}};

 await Future.delayed(const Duration(milliseconds: 700));
  return User(uid: _uid, name: name, photo: 'https://randomuser.me/api/portraits/lego/1.jpg', contacts: []);
}

