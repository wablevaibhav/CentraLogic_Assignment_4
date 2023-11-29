import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/data/models/document.dart';
import 'package:my_document/presentation/widgets/BuildTab.dart';

class MobileListDocumentScreen extends StatelessWidget {
  final String typesDocument;

  const MobileListDocumentScreen({super.key, required this.typesDocument});

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
          typesDocument,
          style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: -0.1,
              height: 1.3),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: buildTabs(documents: getDocumentsToLoad()),
      ),
    );
  }

  getDocumentsToLoad() => switch (typesDocument) {
        "Joining Document" => DocumentsData.joining,
        "Team Documents" => DocumentsData.team,
        "Tax Document" => DocumentsData.tax,
        String() => '',
      };
}
