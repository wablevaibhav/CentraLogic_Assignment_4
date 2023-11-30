import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/core/utils/app_colors.dart';

// TRANSACTION TABLE -> HEADING DESIGN
TableCell headTable({required String text}) {
  return TableCell(
    child: Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          if (text != "Action") const SizedBox(width: 10),
          if (text != "Action")
            Image.asset(
              'assets/arrow_down.png',
              color: AppColors.grey,
              width: 25,
              height: 25,
            ),
        ],
      ),
    ),
  );
}
