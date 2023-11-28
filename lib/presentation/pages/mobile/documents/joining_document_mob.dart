import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JoiningDocumentsMob extends StatefulWidget {
  const JoiningDocumentsMob({super.key});

  @override
  State<JoiningDocumentsMob> createState() => _JoiningDocumentsMobState();
}

class _JoiningDocumentsMobState extends State<JoiningDocumentsMob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/left.png'),
        ),
        title: Text('Joining Documents',style: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: -0.1,
          height: 1.3
        ),),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/pdf.png'),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cheque.pdf', style: GoogleFonts.roboto(
                        color: Colors.black
                      ),),
                      Text('15MB', style: GoogleFonts.roboto(
                          color: Colors.black
                      )),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 200),
                    child: Image.asset('assets/view.png'))
              ],
            ),
            const SizedBox(height: 10,),
            Container(height: 1,width: double.infinity,decoration: BoxDecoration(color: Colors.grey),),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/pdf.png'),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cheque.pdf', style: GoogleFonts.roboto(
                          color: Colors.black
                      ),),
                      Text('15MB', style: GoogleFonts.roboto(
                          color: Colors.black
                      )),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 200),
                    child: Image.asset('assets/view.png'))
              ],
            ),
            const SizedBox(height: 10,),
            Container(height: 1,width: double.infinity,decoration: BoxDecoration(color: Colors.grey),),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/pdf.png'),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cheque.pdf', style: GoogleFonts.roboto(
                          color: Colors.black
                      ),),
                      Text('15MB', style: GoogleFonts.roboto(
                          color: Colors.black
                      )),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 200),
                    child: Image.asset('assets/view.png'))
              ],
            ),
            const SizedBox(height: 10,),
            Container(height: 1,width: double.infinity,decoration: BoxDecoration(color: Colors.grey),),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
