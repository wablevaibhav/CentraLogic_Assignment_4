import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentMob extends StatelessWidget {
  const DocumentMob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text('Documents',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 1.3,
                letterSpacing: -0.4,
                color: const Color(0xff303030),
              )),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
          width: 335,
          height: 207,
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  width: 298,
                  height: 22,
                  child: Text(
                    'Joining Document',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    'assets/right.png',
                    color: Colors.black,
                  ),
                )
              ]),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: const BoxDecoration(color: Colors.grey),
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  width: 298,
                  height: 22,
                  child: Text(
                    'Joining Document',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    'assets/right.png',
                    color: Colors.black,
                  ),
                )
              ]),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: const BoxDecoration(color: Colors.grey),
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  width: 298,
                  height: 22,
                  child: Text(
                    'Joining Document',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    'assets/right.png',
                    color: Colors.black,
                  ),
                )
              ]),
            ],
          ),
        ));
  }
}
