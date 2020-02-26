
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ua_com_knin/activities/search_fragment.dart';
import 'package:ua_com_knin/models/City.dart';
import 'package:ua_com_knin/models/Types.dart';

import '../main.dart';
import 'custom_check_box.dart';

class CitySelector extends StatelessWidget {
  final City city;
  final Types type;

  CitySelector({this.city, this.type}) : super();

  @override
  Widget build(BuildContext context) {
    return CitySelectorFull(type);
  }
}

class CitySelectorFull extends StatefulWidget {
  final Types type;

  CitySelectorFull(this.type) : super();

  @override
  _CitySelectorState createState() => _CitySelectorState(type);
}

class _CitySelectorState extends State<CitySelectorFull> {
  final Types type;

  _CitySelectorState(this.type) : super();

  TextEditingController editingController = TextEditingController();
  Widget changableList;

  List<City> lastCityList = new List();

  Widget citiesListWidget(List<City> as) {

    if (lastCityList.length == 0) {
      lastCityList = new List<City>();
      var c = City();
      c.name = "Все";
      c.id = "-1";
      c.uri = "";
      lastCityList.add(c);
      lastCityList.addAll(as);
    } else {
      lastCityList = new List<City>();
      lastCityList.addAll(as);
    }

    return changableList = ListView.builder(
      shrinkWrap: true,
      itemCount: lastCityList.length,
      itemBuilder: (context, index) {
        addState();
        return GestureDetector(
            onTap: () {
              changeState(index);
              _changeWidgetState(lastCityList);
            },
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 6, //
                    child: _getCities(lastCityList)[index]),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 0.0),
                          child: GestureDetector(
                            child: Opacity(
                              opacity: getStates(index),
                              child: Image.asset(
                                'assets/yes.png',
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 24.0),
                      ],
                    ))
              ],
            )
        );
      },
    );
  }

  List<Widget> _getCities(List<City> cities) {
    List<Widget> citiesList = new List<Widget>();
    for (int i = 0; i < cities.length; i++) {
      citiesList.add(Container(
          margin: const EdgeInsets.only(
              left: 24.0, right: 0.0, bottom: 10.0, top: 10.0),
          child: Text(cities[i].name, style: TextStyle(fontWeight: FontWeight.w400 ,fontSize: 18),)));
    }
    return citiesList;
  }

  List<bool> states = new List();

  double getStates(index){
    return states[index] == true ? 1.0 : 0.0;
  }

  void addState(){
    states.add(false);
  }

  double changeState(index){
    states[index] = !states[index];
    for (int i =0; i < states.length; i++){
      if (i != index) {
        states[i] = false;
      }
    }
        return states[index] == true ? 1.0 : 0.0;
  }

  int getIndexOfSelectedCity(){
    for (int i = 0; i < states.length; i++){
      if (states[i]) {
        return i;
      }
    }
    return 0;
  }

  _changeWidgetState(asTrimmed) {
    setState(() {
      citiesListWidget(asTrimmed);
    });
  }

  @override
  Widget build(BuildContext context) {
    changableList = changableList == null
        ? citiesListWidget(MyApp.cityCollector.getCities())
        : changableList;


    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff0185D4),
          title: Container(child: Text('Город'))),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  var asTrimmed = new List<City>();
                  for (int i = 0;
                      i < MyApp.cityCollector.getCitiesLenght();
                      i++) {
                    String s =
                        MyApp.cityCollector.getCities()[i].name.toLowerCase();
                    if (s.contains(value.toLowerCase())) {
                      asTrimmed.add(MyApp.cityCollector.getCities()[i]);
                    }
                  }
                  if (value == '') {
                    asTrimmed.addAll(MyApp.cityCollector.getCities());
                    _changeWidgetState(asTrimmed);
                  } else {
                    _changeWidgetState(asTrimmed);
                  }
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Город",
                    hintText: "Город",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)))),
              ),
            ),
            Expanded(child: changableList),

            GestureDetector(onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchFragment(
                      city:
                      lastCityList[getIndexOfSelectedCity()],
                      type: type)),
            ),
            child: _roundedButton(context, 'Сохранить', 24, Color(0xff08A233)),)
          ],
        ),
      ),
    );
  }

  Widget _roundedButton(
      BuildContext context, String text, double textSize, color) {
    return Container(
//        color: Colors.green,
//        height: 50,
        child: Container(
      height: 50,
      margin:
          const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 8.0),
      decoration: new BoxDecoration(
        color: color,
        border: new Border.all(color: Colors.white10, width: 2.0),
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: new Center(
        child: new Text(
          text,
          style: new TextStyle(fontSize: textSize, color: Colors.white),
        ),
      ),
    ));
  }
}
