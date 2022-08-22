import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_text_field.dart';
import '../new_account_bloc.dart';
import '../statusDialog/status_dialog_create.dart';

class NewAccountForm extends StatefulWidget {
  const NewAccountForm({Key? key}) : super(key: key);

  @override
  State<NewAccountForm> createState() => _NewAccountFormState();
}

class _NewAccountFormState extends State<NewAccountForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _nameController,
            icon: Icons.person_outline,
            hintText: 'Seu nome',
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            controller: _emailController,
            icon: Icons.email_outlined,
            hintText: '@telemail.com',
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            controller: _passwordController,
            icon: Icons.lock_outline,
            hintText: 'senha',
            isPassword: true,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    _createButtonPressed(context);
                  },
                  child: const Text('Criar'))),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  void _createButtonPressed(BuildContext context) {
    context.read<CreateAccountCubit>().createAccountPressed(
        _nameController.text, _emailController.text, _passwordController.text);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) => StatusDialogCreateAccount(
              createAcountContext: context,
            ));
  }
}
