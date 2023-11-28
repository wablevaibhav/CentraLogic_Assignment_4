class JoiningDocument {
  final String title;
  final String size;
  final String url;

  JoiningDocument({
    required this.title,
    required this.size,
    required this.url,
  });

  factory JoiningDocument.fromJson(Map<String, dynamic> json) {
    return JoiningDocument(
      title: json['title'],
      size: json['size'],
      url: json['url'],
    );
  }
}