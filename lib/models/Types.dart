class Types {

  String id;
  String name;
  String uri;

  Types({this.id, this.name, this.uri});

  factory Types.fromJson(Map<String, dynamic> json) {
    return Types(
        id: json['id'],
        name: json['name'],
        uri: json['uri']
    );
  }

  void setName (String name){
    this.name = name;
  }


}
