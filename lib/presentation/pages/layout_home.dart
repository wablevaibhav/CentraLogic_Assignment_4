import 'package:flutter/material.dart';
import 'package:my_document/presentation/pages/web/DesktopLayoutScreen.dart';

import 'mobile/MobileLayoutScreen.dart';

// SETTING UP LAYOUT SCREEN
class LayoutHome extends StatelessWidget {
  const LayoutHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return DesktopLayoutScreen();
        } else {
          return MobileLayoutScreen();
        }
      },
    );
  }
}
