import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/core/utils/app_colors.dart';

Text subtitleText(String text) => Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.subTitle,
      ),
    );
