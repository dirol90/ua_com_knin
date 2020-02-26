import 'package:ua_com_knin/models/City.dart';

class CitiesCollector {
  List<City> listC = new List();

  void setCities(List<City> listC) {
    this.listC = listC;
  }

  List<City> getCities() {
    return this.listC;
  }

  String getCityName(int id) {
    for (int x = 0; x < listC.length; x++) {
      if (int.parse(listC[x].id) == id) {
        return listC[x].name;
      }
    }

    return "";
  }

  int getCitiesLenght() {
    return this.getCities().length;
  }
}
