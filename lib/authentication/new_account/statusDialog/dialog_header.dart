import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../new_account_bloc.dart';
import '../new_account_states.dart';

class DialogHeader extends StatelessWidget {
  const DialogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 25),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: BlocBuilder<CreateAccountCubit, CreateAccountStates>(
          builder: (context, state) => Text(
            state.title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ));
  }
}
