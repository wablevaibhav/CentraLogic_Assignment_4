import 'package:flutter/material.dart';
import 'package:my_document/core/utils/app_colors.dart';

import '../../widgets/GetPage.dart';

class MobileLayoutScreen extends StatefulWidget {
  const MobileLayoutScreen({super.key});

  @override
  State<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends State<MobileLayoutScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              color: _getIconColor(0),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/document.png',
              color: _getIconColor(1),
            ),
            label: 'Documents',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Center(
        child: GetPage(_currentIndex),
      ),
    );
  }

  Color _getIconColor(int index) {
    return _currentIndex == index ? AppColors.primaryColor : Colors.black;
  }
}
