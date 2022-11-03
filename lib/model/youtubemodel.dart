class youtubemodel {
  int id;
  String link_post;
  String created_at;
  String updated_at;

  youtubemodel(
      {required this.id,

        required this.link_post,
        required this.created_at,
        required this.updated_at});

  factory youtubemodel.fromJson(Map<String, dynamic> json) {
    return youtubemodel(
      id: json['id'],
      link_post:json['link_post'], created_at: json['create_at'], updated_at: json['update_at'],
    );
  }
}

