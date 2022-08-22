import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.icon,
      this.hintText = '', this.isPassword = false})
      : super(key: key);
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.all(6),
            height: 48,
            width: 50,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              icon,
              color: const Color.fromARGB(196, 255, 255, 255),
              size: 28,
            )),
        Expanded(
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                fillColor: const Color.fromARGB(117, 212, 214, 220),
                filled: true,
                hintText: hintText,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    borderSide: BorderSide.none)),
          ),
        ),
      ],
    );
  }
}
