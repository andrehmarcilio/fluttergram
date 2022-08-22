import 'package:flutter/material.dart';

class DialogInitialContent extends StatelessWidget {
  const DialogInitialContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        CircularProgressIndicator(),
        SizedBox(
          height: 10,
        ),
        Text('Carregando'),
      ],
    );
  }
}
