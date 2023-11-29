class Team {
  late String title;
  late String size;
  late String url;

  Team({
    required this.title,
    required this.size,
    required this.url,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(title: json['title'], size: json['size'], url: json['url']);
  }
}
