import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/presentation/pages/web/navigations/home_screen_web.dart';
import 'package:my_document/presentation/pages/web/side_menu.dart';

import '../pages/web/home_screen.dart';

class WebView extends StatelessWidget {
  const WebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.red),
          backgroundColor: const Color(0xFFFFFFFF),
          actions: [
            Padding(
              //fwfwf
              padding: const EdgeInsets.fromLTRB(6, 8, 6, 8),
              child: Container(
                height: 42,
                margin: const EdgeInsets.fromLTRB(2, 2, 20, 2),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xffF5F5F5),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/profile.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Charlies',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Image.asset('assets/arrow.png'),
                  ],
                ),
              ),
            )
          ],
          centerTitle: true,
          title: Text(
            'Documents',
            style: GoogleFonts.roboto(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              height: 1.2,
              letterSpacing: -0.25,
              color: const Color(0xff303030),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        drawer:  SideMenu(),
        body:  HomeScreen());
  }
}
