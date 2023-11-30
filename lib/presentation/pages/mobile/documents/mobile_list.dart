import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/data/models/document.dart';
import 'package:my_document/presentation/widgets/tabs.dart';

class MobileListScreen extends StatelessWidget {
  final String documentType;

  const MobileListScreen({super.key, required this.documentType});

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
          documentType,
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

  getDocumentsToLoad() => switch (documentType) {
        "Joining Document" => DocumentsData.joining,
        "Team Documents" => DocumentsData.team,
        "Tax Document" => DocumentsData.tax,
        String() => [],
      };
}
