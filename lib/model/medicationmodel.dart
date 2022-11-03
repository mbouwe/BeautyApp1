class medicationmodel {
  int id;
  int contact_id;
  String medication;
  String created_at;
  String updated_at;

  medicationmodel(
      {required this.id,
        required this.contact_id,
        required this.medication,
        required this.created_at,
        required this.updated_at});

  factory medicationmodel.fromJson(Map<String, dynamic> json) {
    return medicationmodel(
      id: json['id'],
      contact_id: json['contact_id'], medication:json['medication'], created_at: json['create_at'], updated_at: json['update_at'],
    );
  }
}

