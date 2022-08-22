import 'package:flutter/material.dart';

class BottomDesign extends StatelessWidget {
  const BottomDesign({Key? key, required this.width})
      : super(key: key);
  final double width;


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipPath(
          clipper: MyCustomClipper(isbackGround: true),
          child: Container(
            height: 200,
            width: width,
            color: const Color.fromARGB(79, 33, 149, 243),
          ),
        ),
        ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            height: 170,
            width: width,
            color: const Color.fromARGB(88, 33, 149, 243),
          ),
        ),
        ClipPath(
          clipper: MyCustomClipper(isForeGround: true),
          child: Container(
            height: 170,
            width: width,
            color: const Color.fromARGB(180, 33, 149, 243),
          ),
        ),
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final bool isbackGround;
  final bool isForeGround;
  MyCustomClipper({
    this.isbackGround = false,
    this.isForeGround = false,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    if (isForeGround) {
      path
        ..lineTo(0.0, size.height * 0.33)
        ..quadraticBezierTo(size.width * 0.28, size.height * 0.72,
            size.width * 0.66, size.height * 0.33)
        ..quadraticBezierTo(
            size.width * 0.85, size.height * 0.1, size.width, size.height * 0.2)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..lineTo(0.0, size.height * 0.33)
        ..close();
    } else if (isbackGround) {
      path
        ..lineTo(0.0, size.height * 0.33)
        ..quadraticBezierTo(size.width * 0.33, size.height * 0.1,
            size.width * 0.66, size.height * 0.33)
        ..quadraticBezierTo(
            size.width * 0.85, size.height * 0.5, size.width, size.height * 0.4)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..lineTo(0.0, size.height * 0.33)
        ..close();
    } else {
      path
        ..lineTo(0.0, 0.0)
        ..quadraticBezierTo(size.width * 0.66, size.height * 1, size.width, 0.0)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..lineTo(0.0, size.height * 0.33)
        ..close();
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
