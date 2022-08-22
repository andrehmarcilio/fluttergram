import 'package:flutter/material.dart';

class SinginHeader extends StatelessWidget {
  const SinginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Icon(
            Icons.telegram,
            color: Theme.of(context).colorScheme.secondary,
            size: 140,
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            'Bem-vindo ao Telegram!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
