import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/data/models/TransactionDocument.dart';

import '../../core/utils/app_colors.dart';

SizedBox getListDocuments({
  required double height,
  required scaffoldMessengerContext,
  required final Transaction transaction,
}) =>
    SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Document Name",
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
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
                    color: AppColors.primaryColor,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () async {
                    Navigator.of(context).push(
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
                                color: AppColors.tabUnderlineColor,
                                width: 1,
                              ),
                            ),
                            child: Text('url'),
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.remove_red_eye_outlined,
                      color: AppColors.iconColor, size: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
