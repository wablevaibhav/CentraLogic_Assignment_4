import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/data/models/transaction_document.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../widgets/pdf_view.dart';

SizedBox listDocuments({
  required double height,
  required BuildContext scaffoldMessengerContext,
  required final Transaction transaction,
}) {
  return SizedBox(
    height: height,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Document Name",
          style: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: transaction.documents.length,
            itemBuilder: (context, index) => ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                transaction.documents[index].title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              trailing: IconButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewerScreen(
                          url: transaction.documents[index].url),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/view.png',
                  color: AppColors.icon,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
