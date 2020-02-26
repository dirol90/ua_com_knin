import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ua_com_knin/database/DatabaseHelper.dart';
import 'package:ua_com_knin/models/Advert.dart';
import 'package:ua_com_knin/ui_elements/ad_card.dart';
import 'package:ua_com_knin/ui_elements/bottom_search_bar.dart';

class FavoritesFragment extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    var a = _MyAppState();
    a.getListAdverts();
    return a;
  }
}

class _MyAppState extends State<FavoritesFragment> {
  ScrollController _controller;
  _MyAppState();

  var advList = new List<Advert>();
  var lastIndex = 50;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  bool isLoadingEnded = true;

  @override
  Widget build(BuildContext context) {

    if (advList.length == 0 && !isLoadingEnded)
      return Scaffold(
        appBar: AppBar(
          backgroundColor:  Color(0xff0185D4),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text('Избранное')),
            ],
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator(),
              Text(''),
              Text('LOADING...')],
          ),
        ),
      );
    else if (advList.length != 0)
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0185D4),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text('Избранное')),
            ],
          ),
        ),
        body: ListView.builder(
          controller: _controller,
          itemCount: advList.length,
          itemBuilder: (BuildContext context, int index) {
            return MyCard(advList[index]);
          },
        ),
        bottomNavigationBar: MyBottomBarSearch(1),
      );
    else
      return Scaffold(
        appBar: AppBar(
          backgroundColor:  Color(0xff0185D4),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text('Избранное')),
            ],
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              CircularProgressIndicator(),
              Text(''),
              Text('Вы еще не добавили ни одного объявления в избранное')],
          ),
        ),
        bottomNavigationBar: MyBottomBarSearch(1),
      );
  }

  void loadMoreData(int index){
    if (index + 25 >= advList.length){
      getListAdverts();
    }
  }

  void getListAdverts() async {
    isLoadingEnded = false;
    var list = await DatabaseHelper.instance.queryAllAdverts();
    if (list != null && list.length > 0){
      advList.addAll(list);
    }


    advList.sort((a, b) =>
        a.creation_date_timestamp.compareTo(b.creation_date_timestamp));

    setState(() {
      isLoadingEnded = true;
      advList;
    });
  }
}