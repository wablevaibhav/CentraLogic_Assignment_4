import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';

// HOME SCREEN -> DESKTOP
class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 8, 6, 8),
            child: Container(
              height: 42,
              margin: const EdgeInsets.fromLTRB(2, 2, 20, 2),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.underlineColor),
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
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.width <= 400
            ? MediaQuery.of(context).size.height * 0.06
            : MediaQuery.of(context).size.height * 0.1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            'Welcome To CentraLogic',
            style: GoogleFonts.roboto(
                fontSize: 24,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
