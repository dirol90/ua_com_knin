import 'dart:convert';

class Category {

  String id;
  String name;
  String uri;


  Category({this.id, this.name,
    this.uri
  });

  factory Category.fromJson(Map<String, dynamic> json) {

    return Category(
        id: json['id'],
        name: json['name'],
        uri: json['uri']
    );
  }


}
