import 'package:flutter/material.dart';

import '../pages/mobile/navigations/MobileDocumentScreen.dart';
import '../pages/mobile/navigations/MobileHomeScreen.dart';

Widget GetPage(int index) {
  switch (index) {
    case 0:
      return MobileHomeScreen();
    case 1:
      return MobileDocumentScreen();
    default:
      return Container();
  }
}
