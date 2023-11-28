class TeamDocument {
  final String title;
  final String size;
  final String url;

  TeamDocument({
    required this.title,
    required this.size,
    required this.url,
  });

  factory TeamDocument.fromJson(Map<String, dynamic> json) {
    return TeamDocument(
      title: json['title'],
      size: json['size'],
      url: json['url'],
    );
  }
}