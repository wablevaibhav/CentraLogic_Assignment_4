import 'document.dart';

class TransactionDocument {
  final String address;
  final int transactionId;
  final List<Document> documents;

  TransactionDocument({
    required this.address,
    required this.transactionId,
    required this.documents,
  });

  factory TransactionDocument.fromJson(Map<String, dynamic> json) {
    final List<Document> documents = (json['documents'] as List)
        .map((documentJson) => Document.fromJson(documentJson))
        .toList();

    return TransactionDocument(
      address: json['address'],
      transactionId: json['transactionId'],
      documents: documents,
    );
  }
}
