import 'package:flutter/material.dart';

import '../navigations/mobile_document.dart';
import '../navigations/mobile_home.dart';

// MOBILE BOTTOM NAVIGATION
Widget getPage(int index) {
  switch (index) {
    case 0:
      return const MobileHomeScreen();
    case 1:
      return const MobileDocumentScreen();
    default:
      return Container();
  }
}
