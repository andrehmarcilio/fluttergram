import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../authentication_bloc.dart';
import '../../authentication_event.dart';

class DialogSuccesSinginContent extends StatelessWidget {
  const DialogSuccesSinginContent({Key? key, required this.user})
      : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
         Icon(
          Icons.check,
          size: 60,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Login realizado!"),
        Expanded(child: Container()),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(LoggedIn(user: user));
                Navigator.pop(context);
              },
              child: const Text(
                'fechar',
              ),
            )
          ],
        )
      ],
    );
  }
}
