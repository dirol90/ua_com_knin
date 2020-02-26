import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:ua_com_knin/main.dart';
import 'package:ua_com_knin/database/DatabaseHelper.dart';
import 'package:ua_com_knin/models/Advert.dart';
import 'package:ua_com_knin/ui_elements/body_search.dart';

import 'ad_card_inner.dart';
import 'ad_details.dart';

class MyCard extends StatelessWidget {
//  const MyCard({Key key}) : super(key: key);

  Advert advert;

  MyCard(Advert advert) {
    this.advert = advert;
  }

  @override
  Widget build(BuildContext context) {
    return MyInnerCard(advert);
  }
}

class MyInnerCard extends StatefulWidget {
  Advert advert;

  MyInnerCard(Advert advert) {
    this.advert = advert;
  }

  @override
  _MyInnerCardState createState() => new _MyInnerCardState(advert);
}

class _MyInnerCardState extends State<MyInnerCard> {
  Advert advert;

  _MyInnerCardState(Advert advert) {
    this.advert = advert;
  }

  bool isShow = false;
  bool isLikeClicked = false;

  void showHideWidget(isShow) {
    if (isShow) {
      this.isShow = false;
    } else {
      this.isShow = true;
    }
  }

  _changeWidgetState() {
    setState(() {
      showHideWidget(isShow);
    });
  }

  _changeLikedState(Advert advert) {
    setState(() {
      var a = DatabaseHelper.instance;
      if (isLikeClicked) {
        isLikeClicked = !isLikeClicked;
        advert.isLiked = isLikeClicked;
        a.deleteByID(advert.id);
      } else {
        isLikeClicked = !isLikeClicked;
        advert.isLiked = isLikeClicked;
        advert.description =
            advert.description + " " + MyBodySearchState.currency;
        a.insert(advert);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isLikeClicked = advert.isLiked;
    String monthPrice = "-";
    try {
      var index = advert.description.indexOf(" ");
      var lastWord = advert.description.replaceRange(0, index, "");

      if (lastWord.contains("грн.")) {
        monthPrice = advert.price == 1 ? "-" : "${advert.price} грн.";
      } else if (lastWord.contains("\$")) {
        monthPrice = advert.price == 1 ? "-" : "${advert.price} \$";
      } else {
        monthPrice = advert.price == 1
            ? "-"
            : "${advert.price} ${MyBodySearchState.currency}";
      }
    } catch(e){
      print(e.toString());
    }

    String url = advert.image_urls.length > 0 ? advert.image_urls[0] : "";

    bool isVip = false;
    int advertiserId = -1;
    for (int x = 0; x < MyApp.vipTategoryCollector.getAdvertsLenght(); x++) {
      if (advert.id == MyApp.vipTategoryCollector.getAdverts()[x].id) {
        isVip = true;
        advertiserId = advert.seller_id;
      }
    }

    List<Advert> aList = List();
    if (advertiserId != -1) {
      for (int x = 0; x < MyApp.vipTategoryCollector.getAdvertsLenght(); x++) {
        if (advertiserId ==
                MyApp.vipTategoryCollector.getAdverts()[x].seller_id &&
            advert.id != MyApp.vipTategoryCollector.getAdverts()[x].id) {
          aList.add(MyApp.vipTategoryCollector.getAdverts()[x]);
        }
      }
    }

    String vipImgUrl = isVip ? "assets/vip.png" : "";

    Widget innerWidgets;

    if (isVip && aList.length > 0) {
      innerWidgets = Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('СВОБОДНЫЕ ОБЪЕКТЫ'),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/more.png',
                        width: 20.0, height: 12.0),
                  ),
                ]),
          ),
          Visibility(visible: isShow, child: EmptyObjWidget(aList))
        ],
      );
    } else {
      innerWidgets = Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('СВОБОДНЫЕ ОБЪЕКТЫ'),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/more.png',
                        width: 20.0, height: 12.0),
                  ),
                ]),
          ),
          Visibility(
            visible: isShow,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'ОБЪЕКТЫ СКРЫТЫ',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    String assetUrl =
        isLikeClicked ? 'assets/heart_clicked_ico.png' : 'assets/heart_ico.png';

    Widget moreObjects = advert.type_id == 7
        ? GestureDetector(
            onTap: () => _changeWidgetState(),
            child: Container(
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(0.0),
//                ),
                child: innerWidgets))
        : Container();

    return Container(
      margin: new EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//            GestureDetector(
//                child:
            Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdDetails(advert)),
                  ),
                  child: Container(
                    child: FittedBox(
                      child: new ClipRRect(
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0)),
                        child: Container(
                            child: FadeInImage.assetNetwork(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          placeholder: 'assets/placeholder.png',
                          image: url,
                          fit: BoxFit.fitWidth,
//                        width: 1200,
                        )),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () => _changeLikedState(advert),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 12, 12, 0),
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        assetUrl,
                        height: 24,
                        width: 24,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  height: 50,
                  width: 90,
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    vipImgUrl,
                  ),
                )
              ],
            ),
//                onTap: () => Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => AdDetails(advert)),
//                    )
//            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => AdDetails(advert),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 300),
                ),
//
//                    MaterialPageRoute(builder: (context) => AdDetails(advert)),
              ),
//              child: Padding(
//                padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Цена: ',
                                textAlign: TextAlign.left,
                                style: new TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                '$monthPrice',
                                textAlign: TextAlign.left,
                                style: new TextStyle(
//                                    fontFamily: ,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Площадь: ',
                                textAlign: TextAlign.right,
                                style: new TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                ' ${advert.space_sq_meters} м2.',
                                textAlign: TextAlign.left,
                                style: new TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Text(
                      '${advert.name}',
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Text(
                      '${MyApp.cityCollector.getCityName(advert.city_id)}, ${advert.address}',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Text(
                      '${DateFormat('yyyy.MM.dd – kk:mm').format(DateTime.fromMicrosecondsSinceEpoch(advert.creation_date_timestamp * 1000000))}',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
//              ),
            ),
            moreObjects,
          ],
        ),
      ),
    );
  }
}
