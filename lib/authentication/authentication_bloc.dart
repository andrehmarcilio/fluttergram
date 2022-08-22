import 'package:bloc/bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';
import 'repository/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc(this.userRepository)
      : super(AuthenticationUninitialized()) {
    on<AppStarted>(_statApp);
    on<LoggedIn>(_loggedIn);
    on<LoggedOut>(_loggedOut);
  }

  _statApp(AppStarted event, Emitter<AuthenticationState> emit) async {
    final bool hasToken = await userRepository.hasUser();
    if (hasToken) {
      emit(AuthenticationAuthenticated(await userRepository.getUser()));
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  _loggedIn(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await userRepository.persistUser(event.user);
    emit(AuthenticationAuthenticated(event.user));
  }

  _loggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await userRepository.deleteUser();
    emit(AuthenticationUnauthenticated());
  }

  
}
