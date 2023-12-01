import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:flutter/foundation.dart';

class PdfViewerScreen extends StatelessWidget {
  final String url;

  const PdfViewerScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Viewer")),
      body: _buildPdfView(url),
    );
  }

  Widget _buildPdfView(String url) {
    // Check if the platform is not Windows before using PdfView
    if (!kIsWeb) {
      return Center(
        child: PdfView(
          path: url,
        ),
      );
    } else {
      return const Center(
        child: Text("PDF Viewer is not supported on Windows."),
      );
    }
  }
}
