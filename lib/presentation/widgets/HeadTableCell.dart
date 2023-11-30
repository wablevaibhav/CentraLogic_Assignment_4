import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/core/utils/app_colors.dart';

TableCell getHeadTableCell({required String text}) => TableCell(
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            Text(
              text,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.tabUnderlineColor,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
