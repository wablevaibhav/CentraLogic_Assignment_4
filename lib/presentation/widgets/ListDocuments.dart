import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/entities/document.dart';
import '../themes/app_colors.dart';

SizedBox getListOfDocuments({
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
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(
            height: 08,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
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
                                color: const Color.fromRGBO(
                                  48,
                                  48,
                                  48,
                                  0.05,
                                ),
                                width: 1,
                              ),
                            ),
                            child: Text('url'),
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.primaryColor,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
