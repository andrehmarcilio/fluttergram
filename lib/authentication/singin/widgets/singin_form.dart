import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../new_account/new_account_page.dart';
import '../../widgets/custom_text_field.dart';
import '../singin_bloc.dart';
import '../statusDialog/status_dialog.dart';

class SinginForm extends StatefulWidget {
  const SinginForm({Key? key}) : super(key: key);

  @override
  State<SinginForm> createState() => _SinginFormState();
}

class _SinginFormState extends State<SinginForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 45,),
        CustomTextField(
          controller: _nameController,
          icon: Icons.person_outline,
          hintText: '@telemail.com',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          controller: _passwordController,
          icon: Icons.lock_outline,
          hintText: 'senha',
          isPassword: true,
        ),
        const SizedBox(
          height: 45,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateAccountPage())),
                child: const Text(
                  'Criar conta',
                  style: TextStyle(color: Color.fromARGB(255, 122, 119, 119)),
                )),
            SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<SinginCubit>().enterPressed(
                          _nameController.text, _passwordController.text);
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => const StatusDialog());
                    },
                    child: const Text('Entrar'))),
          ],
        ),
        const SizedBox(height: 25,),
      ]),
    );
  }
}
