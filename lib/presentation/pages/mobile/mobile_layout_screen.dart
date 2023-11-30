import 'package:flutter/material.dart';
import 'package:my_document/presentation/pages/mobile/widgets/custom_navigation.dart';

import 'widgets/get_page.dart';

// LAYOUT SCREEN -> MOBILE
class MobileLayoutScreen extends StatefulWidget {
  const MobileLayoutScreen({
    super.key,
  });

  @override
  State<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends State<MobileLayoutScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Center(
        child: getPage(_currentIndex),
      ),
    );
  }
}
