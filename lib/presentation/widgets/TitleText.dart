import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Text getTitleText(String text) => Text(text,
    style: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(48, 48, 48, 1)));
