import 'package:flutter/material.dart';
import 'package:my_document/presentation/pages/web/desktop_layout.dart';

import 'mobile/mobile_layout_screen.dart';

// SETTING UP LAYOUT SCREEN
class LayoutHome extends StatelessWidget {
  const LayoutHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return const DesktopLayoutScreen();
        } else {
          return const MobileLayoutScreen();
        }
      },
    );
  }
}
