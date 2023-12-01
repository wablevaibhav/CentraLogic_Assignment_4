import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/core/utils/app_colors.dart';
import 'package:my_document/data/models/transaction_document.dart';
import 'package:my_document/presentation/widgets/body_table.dart';
import 'package:my_document/presentation/widgets/head_table.dart';
import 'package:my_document/presentation/widgets/pdf_view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

SizedBox transactionTable(
    {required BuildContext context,
    required List<TransactionDocument> documents}) {
  return SizedBox(
    width: double.infinity,
    child: Table(
      border: TableBorder.all(
        color: AppColors.tabUnderline,
        width: 1,
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(
            color: AppColors.tabUnderline,
          ),
          children: [
            headTable(text: "Document Table"),
            headTable(text: "Checklist Name"),
            headTable(text: "Date & Time"),
            headTable(text: "Status"),
            headTable(text: "Action"),
          ],
        ),
        ...documents.map(
          (e) => TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: bodyTable(text: e.title),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: bodyTable(text: e.checkListName),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: bodyTable(text: e.date),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TableCell(
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
                          ? AppColors.red
                          : AppColors.white,
                    ),
                    child: Center(
                      child: Text(
                        e.status,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: e.status == "Unapproved"
                              ? AppColors.black
                              : AppColors.green,
                        ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewerScreen(url: e.url),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: AppColors.icon,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
