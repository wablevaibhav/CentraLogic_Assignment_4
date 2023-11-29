import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/presentation/themes/app_colors.dart';

import '../../../../data/entities/document.dart';
import '../../../widgets/ListDocuments.dart';
import '../../../widgets/TransactionListText.dart';

class MobileViewTransactionScreen extends StatelessWidget {
  final Transaction transaction;

  const MobileViewTransactionScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            size: 16,
          ),
        ),
        title: Text(
          "Transaction Document",
          style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 19.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 62,
              child: getTransactionListText(
                label: "Transaction Address",
                value: TextEditingController(
                  text: transaction.address,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 62,
              child: getTransactionListText(
                label: "Transaction ID",
                value: TextEditingController(
                  text: "#${transaction.transactionId}",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            getListOfDocuments(
              transaction: transaction,
              height: MediaQuery.of(context).size.height * 0.3,
              scaffoldMessengerContext: scaffoldMessenger,
            ),
          ],
        ),
      ),
    );
  }
}
