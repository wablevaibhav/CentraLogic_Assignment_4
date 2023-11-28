

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> documentsData = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 0;
    fetchData(); // Load data from the local JSON file
  }

  Future<void> fetchData() async {
    try {
      final String data = await rootBundle.loadString('assets/document.json');

      // Parse the JSON data
      final Map<String, dynamic> jsonData = json.decode(data);

      setState(() {
        // Extract and set the data
        documentsData =
            (jsonData['value'] as List<dynamic>).cast<Map<String, dynamic>>();
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error loading data: $error');
      }
    }
    // Load JSON file from assets
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
            unselectedLabelColor: Colors.grey,
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
                buildDocumentTab('joining'),
                buildDocumentTab("transaction"),
                buildDocumentTab("team"),
                buildDocumentTab("tax"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDocumentTab(String category) {
    final List<Map<String, dynamic>> categoryDocuments = (documentsData
        .map((categoryData) =>
            (categoryData[category] as List?)?.cast<Map<String, dynamic>>() ??
            [])
        .expand((documents) => documents)).toList();

    if (categoryDocuments.isEmpty) {
      return Center(
        child: Text(
          'No $category Documents available to display',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: categoryDocuments.length,
      itemBuilder: (context, index) {
        final document = categoryDocuments[index];
        final String title = document['title'] ?? '';
        final String size = document['size'] ?? '';

        if (category == 'transaction') {
          final List<Map<String, dynamic>> documents =
              (document['documents'] as List?)?.cast<Map<String, dynamic>>() ??
                  [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${document['address']}',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                'Transaction ID: ${document['transactionId']}',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: documents.length,
                itemBuilder: (context, documentIndex) {
                  final document = documents[documentIndex];
                  final String documentTitle = document['title'] ?? 'Untitled';
                  final String documentSize =
                      document['size'] ?? 'Unknown size';

                  return ListTile(
                    title: Text(
                      documentTitle,
                      style: GoogleFonts.roboto(color: Colors.black),
                    ),
                    subtitle: Text(documentSize,
                        style: GoogleFonts.roboto(color: Colors.black)),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        foregroundColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: ()  {
                        launch(document['url']);
                      },
                      child: Image.asset('assets/view.png'),
                    ),
                  );
                },
              ),
              const Divider(),
            ],
          );
        } else {
          // For Other Documents
          return ListTile(
            leading: Image.asset('assets/pdf.png'),
            title: Text(
              title,
              style: GoogleFonts.roboto(color: Colors.black),
            ),
            subtitle:
                Text(size, style: GoogleFonts.roboto(color: Colors.black)),
            trailing: TextButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: ()  {
                launch(document['url']);
              },
              child: Image.asset('assets/view.png'),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
