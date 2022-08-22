import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/authentication/new_account/statusDialog/dialog_error_content.dart';
import 'package:telegram_clone/authentication/new_account/statusDialog/dialog_initial_content.dart';
import 'package:telegram_clone/authentication/singin/statusDialog/dialog_success_content.dart';


import '../singin_bloc.dart';
import '../singin_states.dart';

class StatusDialog extends StatelessWidget {
  const StatusDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 65,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 25),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: BlocBuilder<SinginCubit, SinginStates>(
              builder: (context, state) => Text(
                state.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 140,
          width: double.infinity,
          alignment: Alignment.center,
          child: BlocBuilder<SinginCubit, SinginStates>(
            builder: (context, state) {
              if (state is SinginInitialState || state is SinginLoading) {
                return const DialogInitialContent();
              }
              if (state is SinginError) {
                return DialogErrorContent(message: state.message);
              }
              if (state is SinginSuccess) {
                return DialogSuccesSinginContent(user: state.user);
              }
              return Container();
            },
          ),
        ),
      ],
    ));
  }
}
