
import '../models/user.dart';

abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final User user;
  LoggedIn({required this.user}) : super();
}

class LoggedOut extends AuthenticationEvent {}