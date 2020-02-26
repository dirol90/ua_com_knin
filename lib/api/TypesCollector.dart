import 'package:ua_com_knin/models/City.dart';
import 'package:ua_com_knin/models/Types.dart';

class TypesCollector {

  List<Types> listT = new List();

  void setTypes (List<Types> listT) {
    this.listT = listT;
  }

  List<Types> getTypes (){
    return this.listT;
  }

  List<Types> getTypesCopy (){
    List<Types> t = new List();
    for (int i = 0; i < listT.length; i++){
      var type = Types();
      type.id = listT[i].id;
      type.uri = listT[i].uri;
      type.name = listT[i].name;
      t.add(type);
    }

    return t;
  }

  int getTypesLenght(){
    return this.getTypesCopy().length;
  }

}