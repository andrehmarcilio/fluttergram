import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/authentication/authentication_bloc.dart';
import 'package:telegram_clone/authentication/authentication_state.dart';
import '../../app/themes.dart';

import 'custom_expansion.dart';

class HomeDrawerHeader extends StatelessWidget {
  const HomeDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthenticationBloc>().state as AuthenticationAuthenticated;
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SafeArea(
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15),
                  child: CircleAvatar(
                    radius: 30.5,
                    backgroundImage: NetworkImage(state.user.photo),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ThemeSwitcher(
                    builder: (context) => IconButton(
                      onPressed: () {
                        ThemeSwitcher.of(context).changeTheme(
                          theme: ThemeModelInheritedNotifier.of(context)
                                      .theme
                                      .brightness ==
                                  Brightness.light
                              ? darkTheme
                              : lightTheme,
                        );
                      },
                      icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, anim) =>
                              RotationTransition(
                                turns: child.key == const ValueKey('icon1')
                                    ? Tween<double>(begin: 1, end: 0.75)
                                        .animate(anim)
                                    : Tween<double>(begin: 0.75, end: 1)
                                        .animate(anim),
                                child:
                                    FadeTransition(opacity: anim, child: child),
                              ),
                          child: ThemeModelInheritedNotifier.of(context)
                                      .theme
                                      .brightness ==
                                  Brightness.light
                              ? const Icon(Icons.dark_mode,
                                  color: Colors.white, key: ValueKey('icon1'))
                              : const Icon(
                                  Icons.sunny,
                                  color: Colors.white,
                                  key: ValueKey('icon2'),
                                )),
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomExpansion(
            name: state.user.name,
            children: [
              Container(
                width: double.infinity,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                           ListTile(
                              leading: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    radius: 17,
                                    backgroundImage: NetworkImage(state.user.photo),
                                  ),
                                  Container(
                                    height: 14,
                                    width: 14,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 56, 210, 33)),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  )
                                ],
                              ),
                              title: Text(
                                state.user.name,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              )),
                    
                     
           
                     const ListTile(
                        leading: SizedBox(
                          height: 33,
                          width: 33,
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                        title: Text(
                          "Adicionar Conta",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                    const Divider(
                      thickness: 0.6,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
