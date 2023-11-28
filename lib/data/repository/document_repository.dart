import 'dart:convert';

import 'package:flutter/services.dart';

import '../entities/document.dart';

abstract class DocumentRepository {
  Future<List<Document>> fetchData();
}

class JsonDocumentRepository implements DocumentRepository {
  @override
  Future<List<Document>> fetchData() async {
    try {
      final String data = await rootBundle.loadString('assets/document.json');
      final Map<String, dynamic> jsonData = json.decode(data);
      final List<Document> documents = parseDocuments(jsonData);
      return documents;
    } catch (error) {
      print('Error fetching data: $error');
      throw Exception('Failed to fetch data');
    }
  }

  List<Document> parseDocuments(Map<String, dynamic> jsonData) {
    final List<Document> documents = [];
    if (jsonData.containsKey('value') && jsonData['value'] is List) {
      final List<dynamic> categories = jsonData['value'];
      for (final categoryData in categories) {
        if (categoryData is Map<String, dynamic>) {
          for (final category in categoryData.keys) {
            if (categoryData[category] is List) {
              final List<dynamic> categoryDocuments = categoryData[category];
              for (final documentData in categoryDocuments) {
                if (documentData is Map<String, dynamic>) {
                  final Document document = Document(
                    title: documentData['title'] ?? '',
                    size: documentData['size'] ?? '',
                    url: documentData['url'] ?? '',
                    checkListName: documentData['checkListName'] ?? '',
                    date: DateTime.tryParse(documentData['date'] ?? '') ?? DateTime.now(),
                    status: documentData['status'] ?? '',
                  );

                  documents.add(document);
                }
              }
            }
          }
        }
      }
    }

    return documents;
  }
}
