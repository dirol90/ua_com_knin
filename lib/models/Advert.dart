import 'dart:convert';

class Advert {
  int id;
  int city_id;
  int type_id;
  int price;
  int day_price;
  int month_price;
  int space_sq_meters;
  String address;
  String name;
  String description;
  List<String> image_urls;
  int creation_date_timestamp;
  String latitude;
  String longitude;
  int seller_id;
  int category_id;
  bool isVip = false;
  bool isLiked = false;

  Advert(
      {this.id,
      this.city_id,
      this.type_id,
        this.price,
      this.day_price,
      this.month_price,
      this.space_sq_meters,
      this.address,
      this.name,
      this.description,
      this.image_urls,
      this.creation_date_timestamp,
      this.latitude,
      this.longitude,
      this.seller_id,
      this.category_id});

  factory Advert.fromJson(Map<String, dynamic> json) {
    var imgs = json['image_urls'];
    List<String> imageUrls = new List<String>.from(imgs);

    return Advert(
        id: json['id'],
        city_id: json['city_id'],
        type_id: json['type_id'],
        price: json['price'],
        day_price: json['day_price'],
        month_price: json['month_price'],
        space_sq_meters: json['space_sq_meters'],
        address: json['address'].toString(),
        name: json['name'],
        description: json['description'],
        image_urls: imageUrls,
        creation_date_timestamp: json['creation_date_timestamp'],
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
        seller_id: json['seller_id'],
        category_id: json['category_id']);
  }

  Advert.fromMap(Map<String, dynamic> map) {
    RegExp regExp = new RegExp(
      r"(http|ftp|https)://([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?",
      caseSensitive: false,
      multiLine: false,
    );

    Iterable<String> _allStringMatches(String text, RegExp regExp) =>
        regExp.allMatches(text).map((m) => m.group(0));

    List<String> s = _allStringMatches(map['image_urls'], regExp).toList();

    id = map['id'];
    city_id = map['city_id'];
    type_id = map['type_id'];
    price = map['price'];
    day_price = map['day_price'];
    month_price = map['month_price'];
    space_sq_meters = map['space_sq_meters'];
    address = map['address'];
    name = map['name'];
    description = map['description'];
    image_urls = s;
    creation_date_timestamp = map['creation_date_timestamp'];
    latitude = map['latitude'];
    longitude = map['longitude'];
    seller_id = map['seller_id'];
    isVip = map['is_vip'] == 1 ? true : false;
    isLiked = map['is_liked'] == 1 ? true : false;
    category_id = map['category_id'];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'city_id': city_id,
      'type_id': type_id,
      'price': price,
      'day_price': day_price,
      'month_price': month_price,
      'space_sq_meters': space_sq_meters,
      'address': address,
      'name': name,
      'description': description,
      'image_urls': image_urls.asMap(),
      'creation_date_timestamp': creation_date_timestamp,
      'latitude': latitude,
      'longitude': longitude,
      'seller_id': seller_id,
      'is_vip': isVip,
      'is_liked': isLiked,
      'category_id': category_id
    };

    return map;
  }
}
