import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

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
            ),
            title: Text(
              'Home',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  fontSize: 17,
                  letterSpacing: -0.25,
                  color: const Color.fromRGBO(48, 48, 48, 1)),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/document.png',
              width: 24,
              height: 24,
            ),
            title: Text(
              'Documents',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  fontSize: 17,
                  letterSpacing: -0.25,
                  color: const Color(0xfff4811f)),
            ),
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
}
