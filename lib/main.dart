import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ua_com_knin/activities/splash_fragment.dart';
import 'package:ua_com_knin/helper/ApiHelper.dart';
import 'package:ua_com_knin/models/ListCities.dart';
import 'package:ua_com_knin/ui_elements/city_selector.dart';
import 'package:ua_com_knin/ui_elements/type_selector.dart';
import 'activities/search_fragment.dart';
import 'api/CategoryCollector.dart';
import 'api/CitiesCollector.dart';
import 'api/TypesCollector.dart';
import 'api/VipAdvertsCollector.dart';
import 'models/City.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
 static CitiesCollector cityCollector = new CitiesCollector();
 static TypesCollector  typesCollector = new TypesCollector();
 static CategoryCollector categoryCollector = new CategoryCollector();
 static VipAdvertsCollector vipTategoryCollector = new VipAdvertsCollector();

  Widget build(BuildContext context) {

    getApiData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
//      DeviceOrientation.portraitDown,
    ]);


    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      routes: <String, WidgetBuilder>{
        "fragment1": (context) => SplashFragment(),
        "fragment2": (context) => SearchFragment(),
        "fragment3": (context) => CitySelector(),
        "fragment4": (context) => TypeSelector(),
      },
      initialRoute: "fragment1",
    );
  }

  void getApiData () async {
    var a = ApiHelper();

    var listCategory = await a.fetchCategories();
    categoryCollector.setCategories(listCategory.categories);

    var listCity = await a.fetchCity();
    cityCollector.setCities(listCity.cities);

    var listTypes = await a.fetchTypes();
    typesCollector.setTypes(listTypes.types);

    var listVipTypes = await a.fetchVIPAdverts();
    vipTategoryCollector.setTypes(listVipTypes.adverts);


  }

}
