// import 'package:finances_fire/screens/authentication/new_account/new_account_bloc.dart';
// import 'package:finances_fire/screens/authentication/new_account/statusDialog/status_dialog_create.dart';
import 'package:flutter/material.dart';

import 'package:telegram_clone/authentication/widgets/bottom_design.dart';

import 'widgets/new_account_form.dart';



class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  const SizedBox(),
                  Positioned(
                    top: 0,
                    child: SafeArea(
                        child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    )),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: NewAccountForm()
                    ),
                  ),
                  Positioned(bottom: 0, child: BottomDesign(width: width))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
