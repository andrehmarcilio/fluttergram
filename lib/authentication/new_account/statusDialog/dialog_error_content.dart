import 'package:flutter/material.dart';

class DialogErrorContent extends StatelessWidget {
  const DialogErrorContent({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.warning,
          size: 30,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(message),
        Expanded(child: Container()),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('fechar',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary)),
            )
          ],
        )
      ],
    );
  }
}
