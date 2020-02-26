class Post {
  final String name;
  final String phone;
  final int realty_id;

  Post({this.name, this.phone, this.realty_id});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      name: json['name'],
      phone: json['phone'],
      realty_id: json['realty_id']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["phone"] = phone;
    map["realty_id"] = realty_id.toString();

    return map;
  }
}