import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Text getSubtitleText(String text) => Text(text,
    style: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(128, 128, 128, 1)));
