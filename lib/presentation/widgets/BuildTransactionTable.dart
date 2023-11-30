import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/core/utils/app_colors.dart';
import 'package:my_document/data/models/TransactionDocument.dart';
import 'package:my_document/presentation/widgets/BodyTableCell.dart';
import 'package:my_document/presentation/widgets/HeadTableCell.dart';

SizedBox BuildTransactionTable({required List<TransactionDocument> documents}) {
  return SizedBox(
    width: double.infinity,
    child: Table(
      border: TableBorder.all(
        color: AppColors.tabUnderlineColor,
        width: 1,
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(
            color: AppColors.tabUnderlineColor,
          ),
          children: [
            getHeadTableCell(text: "Document Table"),
            getHeadTableCell(text: "CheckList Name"),
            getHeadTableCell(text: "Date & Time"),
            getHeadTableCell(text: "Status"),
            getHeadTableCell(text: "Action"),
          ],
        ),
        ...documents
            .map(
              (e) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: getBodyTableCell(text: e.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: getBodyTableCell(text: e.checkListName),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: getBodyTableCell(text: e.date),
                  ),
                  TableCell(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 15,
                      ),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: e.status == "Unapproved"
                            ? const Color.fromRGBO(255, 0, 0, 0.5)
                            : const Color.fromRGBO(213, 244, 220, 1),
                      ),
                      child: Center(
                        child: Text(
                          e.status,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: e.status == "Unapproved"
                                ? Colors.black
                                : const Color.fromRGBO(32, 135, 56, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TableCell(
                      child: IconButton(
                        onPressed: () {
                          // launch(e.url);
                        },
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.iconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ],
    ),
  );
}
