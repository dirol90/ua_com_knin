import 'package:flutter/material.dart';
import 'package:ua_com_knin/models/Advert.dart';

import 'ad_details.dart';

class EmptyObjWidget extends StatelessWidget {
  List<Advert> aList;

  EmptyObjWidget(List<Advert> aList) {
    this.aList = aList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> lWidget = List();

    for (int x = 0; x < aList.length; x++) {
      lWidget.add(GestureDetector(
          onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => AdDetails(aList[x]),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 300),
                ),
              ),
          child: Container(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Image.network(
                  aList[x].image_urls[0],
                  width: 200.0,
                  height: 100.0,
                  fit: BoxFit.scaleDown,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(aList[x].space_sq_meters.toString()),
                    Text(''),
                    Text(aList[x].name),
                    Text(aList[x].price.toString()),
                  ],
                )
              ],
            ),
          ))));
    }

    return ListView(
      children: lWidget,
    );
  }
}
