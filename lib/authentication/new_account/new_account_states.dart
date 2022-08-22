import '../../models/user.dart';

abstract class CreateAccountStates {
  String title = '';
}

class CreateAccountInitialState extends CreateAccountStates {
  @override
  String get title => 'carregando';
}

class CreateAccountLoading extends CreateAccountStates {
    @override
  String get title => 'carregando';
}

class CreateAccountSuccess extends CreateAccountStates {
  CreateAccountSuccess({required this.user});

    @override
  String get title => 'Sucesso';
  final User user;
}

class CreateAccountError extends CreateAccountStates {
    @override
  String get title => 'Erro';
  final String message;
  CreateAccountError(this.message);
}