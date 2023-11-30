import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/app_colors.dart';

TextField transactionTextField({
  required String label,
  required TextEditingController value,
}) {
  return TextField(
    controller: value,
    enabled: false,
    style: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    decoration: InputDecoration(
      label: Text(
        label,
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.label,
        ),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.underline),
      ),
    ),
  );
}
