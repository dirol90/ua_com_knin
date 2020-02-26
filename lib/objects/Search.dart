import 'package:ua_com_knin/models/Types.dart';

class Search{

   List<int> listTypesIds = new List();
   int cityId;
   int priceFrom;
   int priceTill;
   int spaceFrom;
   int spaceTill;
   int categoryId;

  Search(this.listTypesIds, this.cityId, this.priceFrom, this.priceTill,
      this.spaceFrom, this.spaceTill, this.categoryId
      );

  void setListTypes (List<int> listTypesIds){
    this.listTypesIds = new List();
    this.listTypesIds.addAll(listTypesIds) ;
  }

  List<int>  getListTypes (){
   return listTypesIds;
  }

}