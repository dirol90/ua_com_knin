import 'package:ua_com_knin/models/Advert.dart';

class VipAdvertsCollector {

  List<Advert> listA = new List();

  void setTypes (List<Advert> listA) {
    this.listA = listA;
  }

  List<Advert> getAdverts (){
    return this.listA;
  }

  int getAdvertsLenght(){
    return this.getAdverts().length;
  }

}