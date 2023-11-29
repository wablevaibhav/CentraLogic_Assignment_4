import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/data/entities/document.dart';

import '../../../themes/app_colors.dart';
import 'MobileViewTransactionScreen.dart';

class MobileTransactionScreen extends StatefulWidget {
  final String typesDocument;

  const MobileTransactionScreen({super.key, required this.typesDocument});

  @override
  State<MobileTransactionScreen> createState() =>
      _MobileTransactionScreenState();
}

class _MobileTransactionScreenState extends State<MobileTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/left.png'),
        ),
        title: Text(
          'Transaction Documents',
          style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: -0.1,
              height: 1.3),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: DocumentsData.transactions.length,
            itemBuilder: (context,index) => Card(
          elevation: 0,
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                  DocumentsData.transactions[index].address,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor
                  ),
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Transaction ID: ',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.blackColor
                      ),
                    ),
                    TextSpan(
                      text: '#${DocumentsData.transactions[index].transactionId}',
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ]
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MobileViewTransactionScreen(transaction: DocumentsData.transactions[index]))
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16,),

              ),
            ),
          ),
        )),
      ),
    );
  }
}
