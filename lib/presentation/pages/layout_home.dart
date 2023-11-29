import 'package:flutter/material.dart';

import '../responsive/DesktopLayoutScreen.dart';
import '../responsive/MobileLayoutScreen.dart';

class LayoutHome extends StatelessWidget {
  const LayoutHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return  DesktopLayoutScreen();
        } else {
          return  MobileLayoutScreen();
        }
      },
    );
  }
}
