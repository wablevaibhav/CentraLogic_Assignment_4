class Transaction {
  late String address;
  late int transactionId;
  String date;
  late List<TransactionDocument> documents;

  Transaction({
    required this.address,
    required this.transactionId,
    required this.documents,
    required this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    List<dynamic> documentsList = json['documents'];
    List<TransactionDocument> documents = documentsList
        .map((documentJson) => TransactionDocument.fromJson(documentJson))
        .toList();

    return Transaction(
      date: json['date'],
      address: json['address'],
      transactionId: json['transactionId'],
      documents: documents,
    );
  }
}

class TransactionDocument {
  late String title;
  late String checkListName;
  late String date;
  late String status;
  late String url;

  TransactionDocument({
    required this.title,
    required this.checkListName,
    required this.date,
    required this.status,
    required this.url,
  });

  factory TransactionDocument.fromJson(Map<String, dynamic> json) {
    return TransactionDocument(
      title: json['title'],
      checkListName: json['checkListName'],
      date: json['date'],
      status: json['status'],
      url: json['url'],
    );
  }
}
