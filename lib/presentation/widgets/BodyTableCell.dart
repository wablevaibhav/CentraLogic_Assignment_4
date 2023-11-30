import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/core/utils/app_colors.dart';

// TRANSACTION TABLE -> DESKTOP
TableCell getBodyTableCell({required String text}) => TableCell(
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.tableColor,
            ),
          ),
        ),
      ),
    );
