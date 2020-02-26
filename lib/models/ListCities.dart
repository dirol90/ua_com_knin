import 'package:ua_com_knin/models/City.dart';

class ListCities {
  final List<City> cities;

  ListCities({
    this.cities,
  });

  factory ListCities.fromJson(List<dynamic> parsedJson) {
    List<City> cities= new List<City>();
    cities = parsedJson.map((i)=>City.fromJson(i)).toList();
    return new ListCities(
      cities: cities,
    );
  }
}