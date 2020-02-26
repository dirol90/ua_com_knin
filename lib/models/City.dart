class City {
  String id;
  String name;
  String uri;

  City({this.id, this.name, this.uri});


  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      uri: json['uri'],
    );
  }
}
