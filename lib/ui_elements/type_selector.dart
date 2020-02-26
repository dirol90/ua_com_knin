import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ua_com_knin/activities/search_fragment.dart';
import 'package:ua_com_knin/models/City.dart';
import 'package:ua_com_knin/models/Types.dart';
import 'package:ua_com_knin/ui_elements/body_search.dart';

import '../main.dart';
import 'body_search.dart';

class TypeSelector extends StatelessWidget {
  final City city;
  final Types type;

  TypeSelector({this.city, this.type});

  @override
  Widget build(BuildContext context) {
    return TypeSelectorFull(city);
  }
}

class TypeSelectorFull extends StatefulWidget {
  final City city;

  TypeSelectorFull(this.city) : super();

  @override
  _TypeSelectorState createState() => _TypeSelectorState(city);
}

class _TypeSelectorState extends State<TypeSelectorFull> {
  final City city;

  _TypeSelectorState(this.city) : super();

  TextEditingController editingController = TextEditingController();
  Widget changableList;

  List<Types> lastTypesList = new List();

  Widget typesListWidget(List<Types> as) {

    if (lastTypesList.length == 0) {
      lastTypesList = new List<Types>();
      var t = Types();
      t.name = "Все";
      t.id = "-1";
      t.uri = "";
      lastTypesList.add(t);
      lastTypesList.addAll(as);
    } else {
      lastTypesList = new List<Types>();
      lastTypesList.addAll(as);
    }


    return changableList = ListView.builder(
      shrinkWrap: true,
      itemCount: lastTypesList.length,
      itemBuilder: (context, index) {
        addState();
        return GestureDetector(
            onTap: () {
              changeState(index);
              _changeWidgetState(lastTypesList);
            },
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 6, //
                    child: _getTypes(lastTypesList)[index]),
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
            ));
      },
    );
  }

  List<Widget> _getTypes(List<Types> type) {
    List<Widget> citiesList = new List<Widget>();
    for (int i = 0; i < type.length; i++) {
      citiesList.add(Container(
          margin: const EdgeInsets.only(
              left: 24.0, right: 0.0, bottom: 10.0, top: 10.0),
          child: Text(
            type[i].name,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          )));
    }
    return citiesList;
  }

  List<bool> states = new List();

  double getStates(index) {
    return states[index] == true ? 1.0 : 0.0;
  }

  void addState() {
    states.add(false);
  }

  double changeState(index) {
    states[index] = !states[index];
    for (int i = 0; i < states.length; i++) {
      if (i != index) {
        states[i] = false;
      }
    }
    return states[index] == true ? 1.0 : 0.0;
  }

  int getIndexOfSelectedType() {
    for (int i = 0; i < states.length; i++) {
      if (states[i]) {
        return i;
      }
    }
    return 0;
  }

  _changeWidgetState(asTrimmed) {
    setState(() {
      typesListWidget(asTrimmed);
    });
  }

  @override
  Widget build(BuildContext context) {
    var trimmedList = new List<Types>();
    if (MyBodySearchState.searchObj.categoryId == 1) {
      for (int x = 0; x < MyApp.typesCollector.getTypesLenght(); x++) {
        if (MyApp.typesCollector.getTypesCopy()[x].id == "2" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "3" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "4" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "5" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "6" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "86") {
          trimmedList.add(MyApp.typesCollector.getTypesCopy()[x]);
        }
      }
    } else if (MyBodySearchState.searchObj.categoryId == 2) {
      for (int x = 0; x < MyApp.typesCollector.getTypesLenght(); x++) {
        if (MyApp.typesCollector.getTypesCopy()[x].id == "2" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "3" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "4" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "5" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "6" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "86") {
          trimmedList.add(MyApp.typesCollector.getTypesCopy()[x]);
        }
      }
    } else if (MyBodySearchState.searchObj.categoryId == 3) {
      for (int x = 0; x < MyApp.typesCollector.getTypesLenght(); x++) {
        if (MyApp.typesCollector.getTypesCopy()[x].id == "7" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "8" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "9") {
          trimmedList.add(MyApp.typesCollector.getTypesCopy()[x]);
        }
      }
    } else if (MyBodySearchState.searchObj.categoryId == 4) {
//      for (int x = 0 ; x < MyApp.typesCollector.getTypesLenght(); x++){
//        if (MyApp.typesCollector.getTypes()[x].id == 0
//        ){trimmedList.add(MyApp.typesCollector.getTypes()[x]);}
//      }
    } else if (MyBodySearchState.searchObj.categoryId == 5) {
      for (int x = 0; x < MyApp.typesCollector.getTypesLenght(); x++) {
        if (MyApp.typesCollector.getTypesCopy()[x].id == "10" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "11" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "12" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "13" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "14" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "15" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "96") {
          trimmedList.add(MyApp.typesCollector.getTypesCopy()[x]);
        }
      }
    } else if (MyBodySearchState.searchObj.categoryId == 6) {
      for (int x = 0; x < MyApp.typesCollector.getTypesLenght(); x++) {
        if (MyApp.typesCollector.getTypesCopy()[x].id == "16" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "17" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "18" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "19" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "97" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "97" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "100" ||
            MyApp.typesCollector.getTypesCopy()[x].id == "101") {
          trimmedList.add(MyApp.typesCollector.getTypesCopy()[x]);
        }
      }
    }

    changableList =
        changableList == null ? typesListWidget(trimmedList) : changableList;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff0185D4),
          title: Container(child: Text('Тип'))),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: changableList),
            GestureDetector(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchFragment(
                            city: city,
                            type: lastTypesList[getIndexOfSelectedType()])),
                  ),
              child:
                  _roundedButton(context, 'Сохранить', 24, Color(0xff08A233)),
            )
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
      margin: const EdgeInsets.only(
          left: 16.0, right: 16.0, bottom: 16.0, top: 8.0),
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
