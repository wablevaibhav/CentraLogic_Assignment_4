import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/data/models/transaction_document.dart';

import '../../../../core/utils/app_colors.dart';

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
        const SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: transaction.documents.length,
            itemBuilder: (context, index) => ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                '${transaction.documents[index].title}',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                ),
              ),
              trailing: IconButton(
                onPressed: () async {
                  Navigator.of(scaffoldMessengerContext).push(
                    // Use scaffoldMessengerContext here
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          automaticallyImplyLeading: true,
                        ),
                        body: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.tabUnderline,
                              width: 1,
                            ),
                          ),
                          child: Text('url'),
                        ),
                      ),
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
