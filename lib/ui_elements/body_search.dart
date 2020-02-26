import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ua_com_knin/models/City.dart';
import 'package:ua_com_knin/objects/Search.dart';
import 'package:ua_com_knin/models/Types.dart';
import 'package:ua_com_knin/ui_elements/button_state.dart';
import 'package:ua_com_knin/ui_elements/city_selector.dart';
import 'package:ua_com_knin/ui_elements/type_selector.dart';

import '../main.dart';
import 'ad_selector.dart';

class Tapbox extends StatefulWidget {
  Types type;
  Function() notifyParent;

  Tapbox(Types type, Function() refresh) {
    this.type = type;
    this.notifyParent = refresh;
  }

  @override
  _TapboxState createState() => _TapboxState(type);
}

class _TapboxState extends State<Tapbox> {
  Types type;

  _TapboxState(Types type) {
    this.type = type;
  }

  ButtonState _activeB1 =
  ButtonState(MyBodySearchState.searchObj.categoryId == 1 ? true : false);
  ButtonState _activeB2 =
  ButtonState(MyBodySearchState.searchObj.categoryId == 2 ? true : false);
  ButtonState _activeB3 =
  ButtonState(MyBodySearchState.searchObj.categoryId == 3 ? true : false);
  ButtonState _activeB4 =
  ButtonState(MyBodySearchState.searchObj.categoryId == 4 ? true : false);
  ButtonState _activeB5 =
  ButtonState(MyBodySearchState.searchObj.categoryId == 5 ? true : false);
  ButtonState _activeB6 =
  ButtonState(MyBodySearchState.searchObj.categoryId == 6 ? true : false);

  void _handleTap(ButtonState buttonState) {
    setState(() {
      MyBodySearchState.eTypeController.text = "Все";

      try {
        type.setName("Все");
        type.id = "-1";
      } catch (e) {}

      MyBodySearchState.searchObj.categoryId = -1;
      if (_activeB1 != buttonState) {
        _activeB1.buttonState = false;
      } else {
        MyBodySearchState.searchObj.setListTypes(new List());
        MyBodySearchState.searchObj.categoryId =
            int.parse(MyApp.categoryCollector.listT[0].id);
      }
      if (_activeB2 != buttonState) {
        _activeB2.buttonState = false;
      } else {
        MyBodySearchState.searchObj.setListTypes(new List());
        MyBodySearchState.searchObj.categoryId =
            int.parse(MyApp.categoryCollector.listT[1].id);
      }
      if (_activeB3 != buttonState) {
        _activeB3.buttonState = false;
      } else {
        MyBodySearchState.searchObj.setListTypes(new List());
        MyBodySearchState.searchObj.categoryId =
            int.parse(MyApp.categoryCollector.listT[2].id);
      }
      if (_activeB4 != buttonState) {
        _activeB4.buttonState = false;
      } else {
        MyBodySearchState.searchObj.setListTypes(new List());
        MyBodySearchState.searchObj.categoryId =
            int.parse(MyApp.categoryCollector.listT[3].id);
      }
      if (_activeB5 != buttonState) {
        _activeB5.buttonState = false;
      } else {
        MyBodySearchState.searchObj.setListTypes(new List());
        MyBodySearchState.searchObj.categoryId =
            int.parse(MyApp.categoryCollector.listT[4].id);
      }
      if (_activeB6 != buttonState) {
        _activeB6.buttonState = false;
      } else {
        MyBodySearchState.searchObj.setListTypes(new List());
        MyBodySearchState.searchObj.categoryId =
            int.parse(MyApp.categoryCollector.listT[5].id);
      }
      widget.notifyParent();
      buttonState.changeBtnState();
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: GridView.count(
            childAspectRatio: MediaQuery
                .of(context)
                .size
                .width /
                (MediaQuery
                    .of(context)
                    .size
                    .height)*7.5,
            crossAxisCount: 2,
            children: List.of(<Widget>[
              GestureDetector(
                onTap: () {
                  _handleTap(_activeB1);
//              MyBodySearch.search.setListTypes([2, 3, 4, 5, 6, 86]);
                },
                child: !_activeB1.getButtonState()
                    ? _roundedButton(
                    context, MyApp.categoryCollector.listT[0].name,
                    18, Colors.black, Colors.white)
                    : _roundedButton(
                    context, MyApp.categoryCollector.listT[0].name,
                    18, Colors.black, Color(0xff2AAEFD)),
              ),
              GestureDetector(
                onTap: () {
                  _handleTap(_activeB2);
//              MyBodySearch.search.setListTypes([2, 3, 4, 5, 6, 86]);
                },
                child: !_activeB2.getButtonState()
                    ? _roundedButton(
                    context, MyApp.categoryCollector.listT[1].name,
                    18, Colors.black, Colors.white)
                    : _roundedButton(
                    context, MyApp.categoryCollector.listT[1].name,
                    18, Colors.black, Color(0xff2AAEFD)),
              ),
              GestureDetector(
                onTap: () {
                  _handleTap(_activeB3);
//                MyBodySearch.search.setListTypes([7, 8, 9]);
                },
                child: !_activeB3.getButtonState()
                    ? _roundedButton(
                    context, MyApp.categoryCollector.listT[2].name,
                    18, Colors.black, Colors.white)
                    : _roundedButton(
                    context, MyApp.categoryCollector.listT[2].name,
                    18, Colors.black, Color(0xff2AAEFD)),
              ),
              GestureDetector(
                onTap: () {
                  _handleTap(_activeB4);
//              MyBodySearch.search.setListTypes([]);
                },
                child: !_activeB4.getButtonState()
                    ? _roundedButton(
                    context, MyApp.categoryCollector.listT[3].name,
                    18, Colors.black, Colors.white)
                    : _roundedButton(
                    context, MyApp.categoryCollector.listT[3].name,
                    18, Colors.black, Color(0xff2AAEFD)),
              ),
              GestureDetector(
                  onTap: () {
                    _handleTap(_activeB5);
//                MyBodySearch.search.setListTypes([10, 11, 12, 13, 14, 15, 96]);
                  },
                  child: !_activeB5.getButtonState()
                      ? _roundedButton(
                      context,
                      MyApp.categoryCollector.listT[4].name,
                      18,
                      Colors.black,
                      Colors.white)
                      : _roundedButton(
                      context,
                      MyApp.categoryCollector.listT[4].name,
                      18,
                      Colors.black,
                      Color(0xff2AAEFD))),
              GestureDetector(
                  onTap: () {
                    _handleTap(_activeB6);
//                MyBodySearch.search.setListTypes([16, 17, 18, 19, 97, 98, 100, 101]);
                  },
                  child: !_activeB6.getButtonState()
                      ? _roundedButton(
                      context,
                      MyApp.categoryCollector.listT[5].name,
                      18,
                      Colors.black,
                      Colors.white)
                      : _roundedButton(
                      context,
                      MyApp.categoryCollector.listT[5].name,
                      18,
                      Colors.black,
                      Color(0xff2AAEFD))),
            ]),
          ),
        ));
  }

  // SET BG COLOR 0xFF2AAEFD
  // HERE!!!
  Widget _roundedButton(BuildContext context, String text, double textSize,
      textColor, color) {
    return Container(
        /*height: MediaQuery
            .of(context)
            .size
            .width /
            (MediaQuery
                .of(context)
                .size
                .height / 24),*/
//        color: Colors.green,
        child: Container(
          margin: const EdgeInsets.only(
              left: 4.0, right: 4.0, bottom: 4.0, top: 4.0),
          decoration: new BoxDecoration(
            color: color,
            border: new Border.all(color: Colors.white10, width: 2.0),
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: new Center(
            child: new Text(
              text,
              style: new TextStyle(fontSize: textSize, color: textColor),
            ),
          ),
        ));
  }
}

class MyBodySearch extends StatefulWidget {

  City city;
  Types type;

  MyBodySearch(this.city, this.type);

  @override
  MyBodySearchState createState() => MyBodySearchState(city, type);
}

class MyBodySearchState extends State<MyBodySearch> {
  City city;
  Types type;

  MyBodySearchState(this.city, this.type);

  static Search searchObj = Search(
      new List(),
      -1,
      -1,
      -1,
      -1,
      -1,
      1
//      , true
  );
  static TextEditingController eTypeController = TextEditingController();
  static TextEditingController myControllerP1 = TextEditingController(text: '');
  static TextEditingController myControllerP2 = TextEditingController(text: '');
  static TextEditingController myControllerS3 = TextEditingController(text: '');
  static TextEditingController myControllerS4 = TextEditingController(text: '');
  static var currency = "грн.";
  static var cityName = "";
  refresh() {
    setState(() {
      if (searchObj.categoryId == 2 ||
          searchObj.categoryId == 5) {
        currency = "\$";
      } else {
        currency = "грн.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var cityName = city == null ? 'Все' : city.name;
    var typeName = type == null ? 'Все' : type.name;

    var cityId = city == null ? -1 : city.id;
    if (type != null && type.id != "-1") {
      searchObj.listTypesIds = [int.parse(type.id)];
    }

    eTypeController = TextEditingController(text: typeName);


//    if (eTypeController.text == "Все"){type.name = "Все";}

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: FractionalOffset.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/bg_img.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12, MediaQuery
                                .of(context)
                                .size
                                .height/22, 12, 20),
                        child: Tapbox(type, refresh),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: _editTextBlock(
                                  context,
                                  true,
                                  'Город',
                                  cityName,
                                  1,
                                  null,
                                  null),
                            ),
                            Container(
                              child: _editTextBlock(
                                  context,
                                  false,
                                  'Тип',
                                  typeName,
                                  1,
                                  eTypeController,
                                  null),
                            ),
                            _editTextBlock(
                                context,
                                false,
                                'Цена ($currency)',
                                '',
                                2,
                                myControllerP1,
                                myControllerP2),
//                              _editTextBlock(
//                                  context,
//                                  false,
//                                  'Общая площадь (м. кв.)',
//                                  '',
//                                  2,
//                                  myControllerS3,
//                                  myControllerS4),
                          ],
                        ),
                      ),
                    ),
                  ),
//                  Expanded(
//                    flex: 2,
//                    child:
                  GestureDetector(
                      onTap: () {
//                        List<int> a = new List();
//                        for (int x = 0;
//                            x < MyApp.typesCollector.listT.length;
//                            x++) {
//                          a.add(int.parse(MyApp.typesCollector.listT[x].id));
//                        }
//
//                        if (search.listTypesIds.length == 0) {
//                          MyBodySearch.search.setListTypes(a);
//                        }
                        if (myControllerP1.text != "" &&
                            int.parse(myControllerP1.text) >=
                                int.parse(myControllerP2.text)) {
                          Fluttertoast.showToast(
                              msg:
                              "Стартовое значение не может быть больше или равно максимальному значению",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AdsSelectorActivity(
                                          new Search(
                                              searchObj.listTypesIds,
                                              getTextFromET(cityId.toString(), -1),
                                              getTextFromET(
                                                  myControllerP1.text, 1),
                                              getTextFromET(
                                                  myControllerP2.text,
                                                  10000000),
                                              getTextFromET(
                                                  myControllerS3.text, 1),
                                              getTextFromET(
                                                  myControllerS4.text,
                                                  10000000),
                                              getTextFromET(
                                                  searchObj.categoryId
                                                      .toString(),
                                                  -1)))));
                        }
                      },
                      child: _roundedButtonBig(context, 'Найти', 24,
                          Colors.white, Color(0xff08A233))),
//                  ),
                ],
              ),
            )
          ],
        ));
  }

  var etCounter = 0;

  Widget _editTextBlock(BuildContext context,
      bool withIcon,
      String text,
      String str,
      int countOfEditText,
      TextEditingController c1,
      TextEditingController c2) {
    if (withIcon) {
      return Container(
          margin: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 4.0, top: 4.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 4.0, 0.0, 10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: TextField(
                      textAlign: TextAlign.center,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CitySelector(city: city, type: type)),
                        );
                      },
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(text: str),
                      decoration: InputDecoration(
//                          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                          prefixIcon: Icon(Icons.edit_location))),
                )
              ]));
    } else {
      if (countOfEditText == 2) {
        return Container(
          margin: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 0.0, top: 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 4.0, 0.0, 10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 50.0,
                        child: TextField(
                            controller: c1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
//                                hintText: 'от',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))))),
                      ),
                    ),
                    new Expanded(
                        flex: 1,
                        child: Text(
                          '-',
                          textAlign: TextAlign.center,
                        )),
                    new Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 50.0,
                        child: TextField(
                            controller: c2,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
//                                hintText: 'до',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))))),
                      ),
                    ),
                  ],
                )
              ]),
        );
      } else {
        return Container(
          margin: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 0.0, top: 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 4.0, 0.0, 10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: TextField(
                      textAlign: TextAlign.center,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TypeSelector(city: city, type: type)),
                        );
                      },
                      keyboardType: TextInputType.text,
                      controller: c1,
                      decoration: InputDecoration(
//                          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                          prefixIcon: Icon(Icons.home))),
                )
              ]),
        );
      }
    }
  }

  Widget _roundedButtonBig(BuildContext context, String text, double textSize,
      textColor, color) {
    return Container(
        height: 65,
//        color: Colors.green,
        child: Container(
          margin: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 4.0, top: 8.0),
          decoration: new BoxDecoration(
            color: color,
            border: new Border.all(color: Colors.white10, width: 2.0),
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: new Center(
            child: new Text(
              text,
              style: new TextStyle(fontSize: textSize, color: textColor),
            ),
          ),
        ));
  }

  int getTextFromET(String s, int minValue) {
    if (s != null && s != "") {
      return int.parse(s);
    } else {
      return minValue;
    }
  }
}



