import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ua_com_knin/database/DatabaseHelper.dart';
import 'package:ua_com_knin/models/Advert.dart';
import 'package:ua_com_knin/ui_elements/details_body.dart';

import 'bottom_search_bar.dart';

class AdDetails extends StatelessWidget{

  static Advert advert;

  AdDetails(Advert advert){
    AdDetails.advert = advert;
  }

  @override
  Widget build(BuildContext context) {
    return TopBarWidget();
  }
}


class TopBarWidget extends StatefulWidget {
  TopBarWidget({Key key}) : super(key: key);

  @override
  _TopBarWidgetState createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {

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
        a.insert(advert);
      }
    });
  }
  bool isLikeClicked = false;

  @override
  Widget build(BuildContext context) {
    isLikeClicked = AdDetails.advert.isLiked;
    String assetUrl =
    isLikeClicked ? 'assets/heart_clicked_ico_2.png' : 'assets/heart_ico_2.png';

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff0185D4),
        title: Text(AdDetails.advert.name),
        actions: <Widget>[
          // action button
          GestureDetector(
              onTap: () => _changeLikedState(AdDetails.advert),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                alignment: Alignment.centerRight,
                child: Image.asset(
                  assetUrl,
                  height: 24,
                  width: 24,
                ),
              )),
        ],
      ),
      body: DetailsBody(AdDetails.advert),
      bottomNavigationBar: MyBottomBarSearch(0),
    );
  }
}