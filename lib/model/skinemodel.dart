

class skinemodel {
  late int id;
  late int contact_id;
  late String content;
  late String created_at;
  late String updated_at;

 skinemodel(
      int id,
      int contact_id,
      String content,
      String created_at,
      String updated_at)
      {
        this.id;
        this.contact_id;
        this.content;
        this.created_at;
        this.updated_at;
      }

      skinemodel.fromJson(Map json):
                id=json['id'],
                contact_id=json['contact_id'],
                content=json['content'],
                created_at=json['created_at'],
                updated_at=json['updated_at'];
  Map toJson(){
    return{
      'id':id,
      'contact_id':contact_id,
      'content':content,
      'created_at':created_at,
      'updated_at':updated_at,

    };
  }


}

