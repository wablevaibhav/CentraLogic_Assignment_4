

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/documents/document_bloc.dart';
import '../../bloc/documents/document_event.dart';
import '../../themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> typesDocuments = [
    "Joining Document",
    "Transaction Document",
    "Team Document",
    "Tax Document",
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 0;
    BlocProvider.of<DocumentBloc>(context)
        .add(DocumentsInitialFetchEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Text(
              'Documents',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 1.3,
                letterSpacing: -0.4,
                color: const Color(0xff303030),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: Colors.blue, // Change color as needed
              borderRadius: BorderRadius.circular(10),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: AppColors.separaterColor,
            tabs: const [
              Tab(text: 'Joining Documents'),
              Tab(text: 'Transaction Documents'),
              Tab(text: 'Team Documents'),
              Tab(text: 'Tax Documents'),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // buildDocumentTab('joining'),
                // buildDocumentTab("transaction"),
                // buildDocumentTab("team"),
                // buildDocumentTab("tax"),
              ],
            ),
          ),
        ],
      ),
    );
  }

//   Widget buildDocumentTab(String category) {
//     final List<Map<String, dynamic>> categoryDocuments = (documentsData
//         .map((categoryData) =>
//             (categoryData[category] as List?)?.cast<Map<String, dynamic>>() ??
//             [])
//         .expand((documents) => documents)).toList();
//
//     if (categoryDocuments.isEmpty) {
//       return Center(
//         child: Text(
//           'No $category Documents available to display',
//           style: const TextStyle(
//             fontSize: 18,
//             color: Colors.black,
//           ),
//         ),
//       );
//     }
//
//   //   return ListView.builder(
//   //     itemCount: typesDocuments.length,
//   //     itemBuilder: (context, index) {
//   //         return Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             Text(
//   //               '${documents['address']}',
//   //               style: GoogleFonts.roboto(
//   //                 fontSize: 14,
//   //                 fontWeight: FontWeight.bold,
//   //                 color: Colors.black,
//   //               ),
//   //             ),
//   //             const SizedBox(height: 20,),
//   //             Text(
//   //               'Transaction ID: ${document['transactionId']}',
//   //               style: GoogleFonts.roboto(
//   //                 fontSize: 18,
//   //                 fontWeight: FontWeight.bold,
//   //                 color: Colors.black,
//   //               ),
//   //             ),
//   //             const SizedBox(height: 8),
//   //             ListView.builder(
//   //               shrinkWrap: true,
//   //               physics: const NeverScrollableScrollPhysics(),
//   //               itemCount: documents.length,
//   //               itemBuilder: (context, documentIndex) {
//   //                 final document = documents[documentIndex];
//   //                 final String documentTitle = document['title'] ?? 'Untitled';
//   //                 final String documentSize =
//   //                     document['size'] ?? 'Unknown size';
//   //
//   //                 return ListTile(
//   //                   title: Text(
//   //                     documentTitle,
//   //                     style: GoogleFonts.roboto(color: Colors.black),
//   //                   ),
//   //                   subtitle: Text(documentSize,
//   //                       style: GoogleFonts.roboto(color: Colors.black)),
//   //                   trailing: ElevatedButton(
//   //                     style: ElevatedButton.styleFrom(
//   //                       elevation: 0,
//   //                       foregroundColor: Colors.transparent,
//   //                       backgroundColor: Colors.transparent,
//   //                       shape: RoundedRectangleBorder(
//   //                         borderRadius: BorderRadius.circular(6),
//   //                       ),
//   //                     ),
//   //                     onPressed: ()  {
//   //                       Navigator.push(context, MaterialPageRoute(builder: (context) => PDFView(
//   //                         filePath: documents[index].url,
//   //                         enableSwipe: true,
//   //                         swipeHorizontal: true,
//   //                       )));
//   //                       launch(document['url']);
//   //                     },
//   //                     child: Image.asset('assets/view.png'),
//   //                   ),
//   //                 );
//   //               },
//   //             ),
//   //             const Divider(),
//   //           ],
//   //         );
//   //       } else {
//   //         // For Other Documents
//   //         return ListTile(
//   //           leading: Image.asset('assets/pdf.png'),
//   //           title: Text(
//   //             title,
//   //             style: GoogleFonts.roboto(color: Colors.black),
//   //           ),
//   //           subtitle:
//   //               Text(size, style: GoogleFonts.roboto(color: Colors.black)),
//   //           trailing: TextButton(
//   //             style: ElevatedButton.styleFrom(
//   //               shape: RoundedRectangleBorder(
//   //                 borderRadius: BorderRadius.circular(6),
//   //               ),
//   //             ),
//   //             onPressed: ()  {
//   //               Navigator.push(context, MaterialPageRoute(builder: (context) => PDFView(
//   //                 filePath: documents[index].url,
//   //                 enableSwipe: true,
//   //                 swipeHorizontal: true,
//   //               )));
//   //             },
//   //             child: Image.asset('assets/view.png'),
//   //           ),
//   //         );
//   //       }
//   //     },
//   //   );
//   // }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }
}
