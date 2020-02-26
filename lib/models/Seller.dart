class Seller {
  final int id;
  final String name;
  final String phone;
  final String link_to_profile;
  final String image_url;

  Seller(
      {this.id, this.name, this.phone, this.link_to_profile, this.image_url});

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        link_to_profile: json['link_to_profile'],
        image_url: json['image_url']
    );
  }
}
