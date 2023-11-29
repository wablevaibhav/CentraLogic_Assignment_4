import 'TransactionDocument.dart';

class Transaction {
  late String address;
  late int transactionId;
  late List<TransactionDocument> documents;

  Transaction({
    required this.address,
    required this.transactionId,
    required this.documents,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    List<dynamic> documentsList = json['documents'];
    List<TransactionDocument> documents = documentsList
        .map((documentJson) => TransactionDocument.fromJson(documentJson))
        .toList();

    return Transaction(
      address: json['address'],
      transactionId: json['transactionId'],
      documents: documents,
    );
  }
}
