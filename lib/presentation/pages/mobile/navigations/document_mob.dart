import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/presentation/pages/mobile/documents/joining_document_mob.dart';
import 'package:my_document/presentation/pages/mobile/documents/tax_document_mob.dart';
import 'package:my_document/presentation/pages/mobile/documents/team_document_mob.dart';
import 'package:my_document/presentation/pages/mobile/documents/transaction_document_mob.dart';

class DocumentMob extends StatelessWidget {
  const DocumentMob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text('Documents',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              height: 1.3,
              letterSpacing: -0.4,
              color: const Color(0xff303030),
            )),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => JoiningDocumentsMob()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Joining Document', style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.1,
                    height: 1.3
                  ),),
                  Image.asset('assets/right.png', width: 25, height: 25,)
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(height: 1,width: double.infinity,decoration: BoxDecoration(color: Colors.grey),),
            const SizedBox(height: 5,),
            TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => TransactionDocumentMob()));
                },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Transaction Document', style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.1,
                      height: 1.3
                  ),),
                  Image.asset('assets/right.png', width: 25, height: 25,)
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(height: 1,width: double.infinity,decoration: BoxDecoration(color: Colors.grey),),
            const SizedBox(height: 5,),
            TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => TeamDocumentMob()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Team Document', style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.1,
                      height: 1.3
                  ),),
                  Image.asset('assets/right.png', width: 25, height: 25,)
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(height: 1,width: double.infinity,decoration: BoxDecoration(color: Colors.grey),),
            const SizedBox(height: 5,),
            TextButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => TaxDocumentMob()));
                },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tax Document', style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.1,
                      height: 1.3
                  ),),
                  Image.asset('assets/right.png', width: 25, height: 25,)
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
