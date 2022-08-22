import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:telegram_clone/models/user.dart';

class UserRepository {

  final _storage =  const FlutterSecureStorage();
  static const String _key = 'user';
  
  Future<void> deleteUser() async {
    await _storage.delete(key: _key);
    return;
  }

  Future<void> persistUser(User user) async {
    String userJson = jsonEncode(user.toJson());
    await _storage.write(key: _key, value: userJson);
    return;
  }

  Future<bool> hasUser() async {
    String? value = await _storage.read(key: _key);
    return value != null;
  }

  Future<User> getUser() async {
    String? value = await _storage.read(key: _key);
    Map userJson = jsonDecode(value!);
    return User.fromRepository(userMap: userJson);
  }

   Future<String> getToken() async {
    String? value = await _storage.read(key: _key);
    Map userJson = jsonDecode(value!);
    return userJson['uid'];
  }
}