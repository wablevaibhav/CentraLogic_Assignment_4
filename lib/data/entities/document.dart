class Document {
  final String title;
  final String checkListName;
  final DateTime date;
  final String status;
  final String url;

  Document({
    required this.title,
    required this.checkListName,
    required this.date,
    required this.status,
    required this.url, required size,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      title: json['title'],
      checkListName: json['checkListName'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      url: json['url'],
    );
  }
}
