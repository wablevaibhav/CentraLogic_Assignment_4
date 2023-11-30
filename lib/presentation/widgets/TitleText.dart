import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/core/utils/app_colors.dart';

// TRANSACTION TITLE TEXT
Text getTitleText(String text) => Text(text,
    style: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.tabUnderlineColor));
