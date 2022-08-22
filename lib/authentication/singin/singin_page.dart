import 'package:flutter/material.dart';
import 'package:telegram_clone/authentication/singin/widgets/singin_form.dart';
import 'package:telegram_clone/authentication/singin/widgets/singin_header.dart';
import 'package:telegram_clone/authentication/widgets/bottom_design.dart';

class SinginPage extends StatelessWidget {
  const SinginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SinginHeader(),
                 
                  const SinginForm(),
                  BottomDesign(width: width,)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
