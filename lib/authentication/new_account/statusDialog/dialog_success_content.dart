import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/models/user.dart';

import '../../authentication_bloc.dart';
import '../../authentication_event.dart';

class DialogSuccessContent extends StatelessWidget {
  const DialogSuccessContent({ Key? key, required this.createAccountContext,  required this.user }) : super(key: key);
  final BuildContext createAccountContext;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.check,
                      size: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Conta criada!"),
                    Expanded(child: Container()),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<AuthenticationBloc>().add(LoggedIn(user: user));
                            Navigator.of(context).pop();
                            Navigator.of(createAccountContext).pop();
                          },
                          child: Text('fechar',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                        )
                      ],
                    )
                  ],
                );
  }
}