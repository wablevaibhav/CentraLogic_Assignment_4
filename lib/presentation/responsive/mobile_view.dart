import 'package:flutter/material.dart';
import 'package:my_document/presentation/pages/mobile/navigations/document_mob.dart';
import 'package:my_document/presentation/pages/mobile/navigations/home_screen_mob.dart';
import 'package:my_document/presentation/themes/app_colors.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
        child: _getPage(_currentIndex),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreenMob();
      case 1:
        return DocumentMob();
      default:
        return Container();
    }
  }

  Color _getIconColor(int index) {
    return _currentIndex == index ? AppColors.primaryColor : Colors.black;
  }
}
