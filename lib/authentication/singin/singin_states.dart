import '../../models/user.dart';

abstract class SinginStates {
  String title = "";
}

class SinginInitialState extends SinginStates {
    @override
  String get title => 'Carregando';
}

class SinginLoading extends SinginStates {
    @override
  String get title => 'Carregando';
}

class SinginSuccess extends SinginStates {
    @override
  String get title => 'Sucesso';
  SinginSuccess({required this.user});
  final User user;
}

class SinginError extends SinginStates {
    @override
  String get title => 'Erro';
  final String message;
  SinginError(this.message);
}
