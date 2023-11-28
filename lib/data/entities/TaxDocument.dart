class TaxDocument {
  final String title;
  final String size;
  final String url;

  TaxDocument({
    required this.title,
    required this.size,
    required this.url,
  });

  factory TaxDocument.fromJson(Map<String, dynamic> json) {
    return TaxDocument(
      title: json['title'],
      size: json['size'],
      url: json['url'],
    );
  }
}
