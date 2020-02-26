import 'package:ua_com_knin/models/Advert.dart';

class ListAdverts {
  final List<Advert> adverts;

  ListAdverts({
    this.adverts,
  });

  factory ListAdverts.fromJson(List<dynamic> parsedJson) {
    List<Advert> adverts= new List<Advert>();
    adverts = parsedJson.map((i)=>Advert.fromJson(i)).toList();
    return new ListAdverts(
      adverts: adverts,
    );
  }
}