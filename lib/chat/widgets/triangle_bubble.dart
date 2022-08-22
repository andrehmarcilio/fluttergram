import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path
       ..lineTo(0.0, 0.0)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.8, size.width, size.height)
      ..lineTo(0.0, size.height)
      ..lineTo(0.0, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}