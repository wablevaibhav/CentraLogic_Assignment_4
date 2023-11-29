class Joining {
  late String title;
  late String size;
  late String url;

  Joining({
    required this.title,
    required this.size,
    required this.url,
  });

  factory Joining.fromJson(Map<String, dynamic> json) {
    return Joining(
      title: json['title'],
      size: json['size'],
      url: json['url'],
    );
  }
}
