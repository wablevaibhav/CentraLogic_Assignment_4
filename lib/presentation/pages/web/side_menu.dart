import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/presentation/pages/web/navigations/document_screen_web.dart';
import 'package:my_document/presentation/pages/web/navigations/home_screen_web.dart';
import 'package:my_document/presentation/themes/app_colors.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Container(
            margin:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Image.asset(
              'assets/logo.png',
              width: 198,
              height: 42,
            ),
          ),
          Container(
            height: 1,
            margin:
            const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          ),
          ListTile(
            leading: Image.asset(
              'assets/home.png',
              width: 24,
              height: 24,
              color: _getIconColor(0),

            ),
            title: Text(
              'Home',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  fontSize: 17,
                  letterSpacing: -0.25,
                  color: _getIconColor(0)),
            ),
            onTap: () {
              _changeScreen(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/document.png',
              width: 24,
              height: 24,
              color: _getIconColor(1),
            ),
            title: Text(
              'Documents',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  fontSize: 17,
                  letterSpacing: -0.25,
                  color: _getIconColor(1)),
            ),
            onTap: () {
              _changeScreen(1);
              Navigator.pop(context);
            },
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.fromLTRB(20, 550, 20, 20),
            child: Text(
              'Copyrights © 2023. All rights reserved.',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                fontSize: 12,
                height: 1.3,
                color: const Color.fromRGBO(128, 128, 128, 1),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color _getIconColor(int index) {
    return _currentIndex == index ? AppColors.primaryColor : Colors.black;
  }

  void _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreenWeb()));
    } else if (index == 1) {
      Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentScreenWeb()));
    }
  }
}