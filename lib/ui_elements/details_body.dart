import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ua_com_knin/activities/map_fragment.dart';
import 'package:ua_com_knin/helper/StringHtmlCleaner.dart';
import 'package:ua_com_knin/models/Advert.dart';
import 'package:ua_com_knin/ui_elements/body_search.dart';

import '../main.dart';
import 'ad_dialog.dart';

class DetailsBody extends StatelessWidget {
  Advert advert;

  DetailsBody(Advert advert) {
    this.advert = advert;
  }

  @override
  Widget build(BuildContext context) {
    String monthPrice = "-";

    try {
      var index = advert.description.indexOf(" ");
      var lastWord = advert.description.replaceRange(0, index, "");

      if (lastWord.contains("грн.")) {
        monthPrice = advert.price == 1 ? "-" : "${advert.price} грн.";
        advert.description = advert.description.replaceAll("грн.", "");
      } else if (lastWord.contains("\$")) {
        monthPrice = advert.price == 1 ? "-" : "${advert.price} \$";
        advert.description = advert.description.replaceAll("\$", "");
      } else {
        monthPrice = advert.price == 1
            ? "-"
            : "${advert.price} ${MyBodySearchState.currency}";
      }
    } catch (e){
      print(e.toString());
    }
//    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 20,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 200,
                  child: _createGalery(),
                ),
                Container(
                  padding: new EdgeInsets.only(left: 0.0, right: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
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
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  Text(
                                    '$monthPrice',
                                    textAlign: TextAlign.left,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0,
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
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  Text(
                                    '${advert.space_sq_meters} м2.',
                                    textAlign: TextAlign.left,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: new EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              '${advert.name}',
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                              ),
                            ),
                            AutoSizeText(
                              '${MyApp.cityCollector.getCityName(advert.city_id)}, ${advert.address}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10.0,
                              ),
                            ),
                            AutoSizeText(
                              '${DateFormat('yyyy.MM.dd – kk:mm').format(DateTime.fromMicrosecondsSinceEpoch(advert.creation_date_timestamp * 1000000))}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
//                        child: Html(data: "${advert.description}"),
                          child: SelectableText(StringHtmlCleaner()
                              .parseHtmlString(advert.description))),
                      _getMapBtn(advert, context)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: GestureDetector(
                  child: _roundedButton(
                      context, 'Отправить заявку', 24, Color(0xff08A233)),
                  onTap: () async => await showDialog(
                        context: context,
                        builder: (context) => AdOrderDialog(advert),
                      ).then((val) {
//            Navigator.pop(_context);
                      })))
        ],
      ),
    );
  }

  Widget _createGalery() {
    return Swiper(
      containerHeight: 150,
      containerWidth: 335,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            child: FadeInImage.assetNetwork(
          placeholder: 'assets/placeholder.png',
          image: advert.image_urls[index],
          fit: BoxFit.fitWidth,
//                        width: 1200,
        ));
      },
      itemCount: advert.image_urls.length,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }

  Widget _roundedButton(
      BuildContext context, String text, double textSize, color) {
    return Container(
        height: 90,
//        color: Colors.green,
        child: Container(
          margin: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 16.0, top: 8.0),
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

  Widget _getMapBtn(Advert advert, context) {
    if (advert.latitude == null ||
        advert.longitude == null ||
        advert.latitude == "" ||
        advert.longitude == "") {
      return Container();
    } else {
      return Container(
        child: GestureDetector(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapFragment(advert)),
                ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
                    child: Text(
                      'Показать на карте',
                      style: new TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Container(margin: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
                  child: Center(
                  child: Image.asset(
                    'assets/map_ico.png',
                    height: 96,
                    width: 96,
                  ),
                ),)
              ],
            )),
      );
    }
  }
}
