import 'package:flutter/material.dart';

import 'home_drawer_body.dart';
import 'home_drawer_header.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          HomeDrawerHeader(),
          HomeDrawerBody(),
        ],
      ),
    );
  }
}

