class challengemodel {
  int id;
  String title;
  String description;
  String date_from;
  String date_to;
  String created_at;
  String updated_at;

  challengemodel(
      {required this.id,
        required this.title,
        required this.description,
        required this.date_from,
        required this.date_to,
        required this.created_at,
        required this.updated_at});

  factory challengemodel.fromJson(Map<String, dynamic> json) {
    return challengemodel(
      id: json['id'],
      title: json['contact_id'],
      description:json['medication'],
      date_from:json['date_from'],
      date_to:json['date_to'],
      created_at: json['create_at'],
      updated_at: json['update_at'],
    );
  }
}

