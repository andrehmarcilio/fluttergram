import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegram_clone/authentication/new_account/statusDialog/dialog_header.dart';


import '../new_account_bloc.dart';
import '../new_account_states.dart';
import 'dialog_error_content.dart';
import 'dialog_initial_content.dart';
import 'dialog_success_content.dart';


class StatusDialogCreateAccount extends StatelessWidget {
  const StatusDialogCreateAccount({Key? key, required this.createAcountContext}) : super(key: key);
  final BuildContext createAcountContext;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DialogHeader(),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.center,
          child: BlocBuilder<CreateAccountCubit, CreateAccountStates>(
            builder: (context, state) {
              if (state is CreateAccountInitialState || state is CreateAccountLoading) {
                return const DialogInitialContent();
              }
              if (state is CreateAccountError) {
                return DialogErrorContent(message: state.message);
              }
              if (state is CreateAccountSuccess) {
                return DialogSuccessContent(createAccountContext: createAcountContext, user: state.user,);
              }
              return Container();
            },
          ),
        ),
      ],
    ));
  }
}
