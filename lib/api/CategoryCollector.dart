import 'package:ua_com_knin/models/Category.dart';

class CategoryCollector {

  List<Category> listT = new List();

  void setCategories (List<Category> listT) {
    this.listT = listT;
  }

  List<Category> getCategories (){
    return this.listT;
  }

  int getCategorisLenght(){
    return this.getCategories().length;
  }

}