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
