import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_document/presentation/pages/layout_home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String url;

  const PdfViewerScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Running on the web, open the PDF in a new tab
      launchUrl(Uri.parse(url));
      return const LayoutHome(); // or any placeholder widget
    } else {
      // Running on a mobile platform, use syncfusion_flutter_pdfviewer
      return Scaffold(
        appBar: AppBar(
          title: const Text('PDF Viewer'),
        ),
        body: SfPdfViewer.network(
          url,
          canShowScrollHead: false,
        ),
      );
    }
  }
}
