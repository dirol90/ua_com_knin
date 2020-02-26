import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ua_com_knin/activities/favorites_fragment.dart';
import 'package:ua_com_knin/activities/more_fragment.dart';
import 'package:ua_com_knin/activities/search_fragment.dart';

class MyBottomBarSearch extends StatelessWidget {
  get bottomNavigationBar => null;
  int pressedIndex = -1;

  MyBottomBarSearch(this.pressedIndex);

  @override
  Widget build(BuildContext context) {
    var btnCollor1 = Color(0x00FFFFFF);
    var btnCollor2 = Color(0x00FFFFFF);
    var btnCollor3 = Color(0x00FFFFFF);

    switch (pressedIndex) {
      case (0):
        {
          btnCollor1 = Color(0xff0069A8);
          break;
        }
      case (1):
        {
          btnCollor2 = Color(0xff0069A8);
          break;
        }
      case (2):
        {
          btnCollor3 = Color(0xff0069A8);
          break;
        }
    }

    var itemHeight = 50.0;
    if (Platform.isAndroid) {
      itemHeight = 50;
    } else if (Platform.isIOS) {
      itemHeight = 65;
    }


    return Container(
        color: Color(0xff0185D4),
        height: itemHeight,
        child: Center(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            children: <TableRow>[
              TableRow(children: <Widget>[
                SafeArea(
                  child: Container(
                    height: itemHeight,
                    decoration: new BoxDecoration(
                        color: btnCollor1,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: GestureDetector(
                      onTap: () {
                        if (pressedIndex != 0){
                        Navigator.of(context).pushAndRemoveUntil(
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => SearchFragment(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration: Duration(milliseconds: 300),
                            ),
                            (Route<dynamic> route) => false
//                          new MaterialPageRoute(
//                              builder: (BuildContext context) =>
//                                  SearchFragment())

                            );}
                      },
                      child: Container(
                        color: btnCollor1,
                        margin: const EdgeInsets.only(
                            top: 4.0, left: 4.0, right: 4.0, bottom: 4.0),
                        child: Column(children: <Column>[
                          Column(children: <Widget>[
                            Image.asset(
                              'assets/bot_1.png',
                              fit: BoxFit.scaleDown,
                              width: 25.0,
                              height: 25.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                'Главная',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9,
                                    color: Colors.white),
                              ),
                            ),
                          ]),
                        ]),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    height: itemHeight,
                    decoration: new BoxDecoration(
                        color: btnCollor2,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: GestureDetector(
                      onTap: () {
                        if (pressedIndex != 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoritesFragment()),
                          );
                        }
                      },
                      child: Container(
                        color: btnCollor2,
                        margin: const EdgeInsets.only(
                            top: 4.0, left: 4.0, right: 4.0, bottom: 4.0),
                        child: Column(children: <Column>[
                          Column(children: <Widget>[
                            Image.asset(
                              'assets/bot_3.png',
                              fit: BoxFit.scaleDown,
                              width: 25.0,
                              height: 25.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                'Избранное',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9,
                                    color: Colors.white),
                              ),
                            ),
                          ]),
                        ]),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Container(
                    height: itemHeight,
                    decoration: new BoxDecoration(
                        color: btnCollor3,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: GestureDetector(
                      onTap: () {
                        if (pressedIndex !=2 ) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoreFragment()),
                          );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 4.0, left: 4.0, right: 4.0, bottom: 4.0),
                        child: Column(children: <Column>[
                          Column(children: <Widget>[
                            Image.asset(
                              'assets/bot_2.png',
                              fit: BoxFit.scaleDown,
                              width: 25.0,
                              height: 25.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                'Еще',
                                textAlign: TextAlign.center,
                                style: new TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9,
                                    color: Colors.white),
                              ),
                            )
                          ]),
                        ]),
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ));
  }
}
