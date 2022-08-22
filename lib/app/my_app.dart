import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/authentication/repository/user_repository.dart';
import '../authentication/authentication_bloc.dart';
import '../authentication/authentication_event.dart';
import '../authentication/authentication_state.dart';
import '../authentication/new_account/new_account_bloc.dart';
import '../authentication/singin/singin_bloc.dart';
import '../authentication/singin/singin_page.dart';
import '../splash/splash_page.dart';
import 'themes.dart';

import '../home/home_page.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: lightTheme,
      builder: (_, theme) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SinginCubit(_userRepository)),
              BlocProvider(create: (context) => CreateAccountCubit()),
              BlocProvider(create: (context) {
                AuthenticationBloc _authBloc =
                    AuthenticationBloc(_userRepository);
                _authBloc.add(AppStarted());
                return _authBloc;
              }),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              home:  BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationUninitialized) {
                return const SplashPage();
              }
              if (state is AuthenticationAuthenticated) {
                return  HomeContainer();
              }
              if (state is AuthenticationUnauthenticated) {
                return const SinginPage();
              }
              if (state is AuthenticationLoading) {
                return const Center(child: CircularProgressIndicator(),);
              }
              return Container();
            },
          ),
            ));
      },
    );
  }
}
