import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ua_com_knin/helper/ApiHelper.dart';
import 'package:ua_com_knin/models/Advert.dart';
import 'package:ua_com_knin/models/ListAdverts.dart';
import 'package:ua_com_knin/objects/Search.dart';

import '../main.dart';
import 'ad_card.dart';
import 'bottom_search_bar.dart';

class AdsSelectorActivity extends StatefulWidget {
  final Search search;

  AdsSelectorActivity(this.search);

  @override
  State<StatefulWidget> createState() {
    var a = _MyAppState(search);
    a.getListAdverts(100, 0);
    return a;
  }
}

class _MyAppState extends State<AdsSelectorActivity> {
  final Search search;

  _MyAppState(this.search);

  var advList = new List<Advert>();
  var lastIndex = 100;

  bool isLoadingEnded = true;

  @override
  Widget build(BuildContext context) {
    var circle = !isLoadingEnded ? CircularProgressIndicator() : Container();

    if (advList.length == 0 && !isLoadingEnded)
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
                  child: Text('KNIN.COM.UA')),
            ],
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Text(''),
              Text('LOADING...')
            ],
          ),
        ),
      );
    else if (advList.length != 0) {
      List<Advert> tempist = List();
      for (int i = 0; i < MyApp.vipTategoryCollector.getAdvertsLenght(); i++) {
        if ((search.getListTypes().length == 0 ||
            search.getListTypes().contains(MyApp.vipTategoryCollector.getAdverts()[i].type_id)) &&
            (search.cityId == -1 ||
                search.cityId == MyApp.vipTategoryCollector.getAdverts()[i].city_id) &&
        search.categoryId == MyApp.vipTategoryCollector.getAdverts()[i].category_id

        ) {
          tempist.add(MyApp.vipTategoryCollector.getAdverts()[i]);
        }
      }

//      tempist.addAll(advList);
//      advList = List<Advert>();
//      advList.addAll(tempist);
//      tempist = List<Advert>();


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
                  child: Text('KNIN.COM.UA')),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                    scrollInfo.metrics.maxScrollExtent > 720) {
                  requestIterator = 0;
                  setState(() {
                    isLoadingEnded = false;
                  });
                  getListAdverts(100, lastIndex);
                }
              },
              child: ListView.builder(
//            controller: _controller,
                itemCount: advList.length,
                itemBuilder: (BuildContext context, int index) {
                  print(advList.length);
                  print(index);
                  print('${advList[index].name}');
                    return GestureDetector(
                      child: MyCard(advList[index]),
                    );

                },
              ),
            ),
            Center(
              child: circle,
            ),
          ],
        ),
        bottomNavigationBar: MyBottomBarSearch(0),
      );
    }else
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
                  child: Text('KNIN.COM.UA')),
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
              Text(
                  'Нам не удалось найти ни одного объявнения,\n попробуйте изменить критерии поиска')
            ],
          ),
        ),
        bottomNavigationBar: MyBottomBarSearch(0),
      );
  }

  var requestIterator = 0;

  void getListAdverts(int limit, int startFrom) async {

    if (advList.length == 0) {
//      for (int x = 0; x < MyApp.vipTategoryCollector.getAdvertsLenght(); x++) {
//        if (
////        MyApp.vipTategoryCollector.getAdverts()[x].city_id ==
////            search.cityId &&
//            MyApp.vipTategoryCollector.getAdverts()[x].category_id ==
//                search.categoryId) {
//          advList.add(MyApp.vipTategoryCollector.getAdverts()[x]);
//        }
//      }
    }

    isLoadingEnded = false;

    var a = ApiHelper();
    var advListFromApi = new List<Advert>();
    ListAdverts listAdverts;
    try {
      listAdverts = await a.fetchSearchAdverts(
          search.cityId.toString(),
          search.listTypesIds,
          search.categoryId,
          search.priceFrom,
          search.priceTill,
          limit,
          startFrom);

      for (int i1 = 0; i1 < listAdverts.adverts.length; i1++) {
        bool isAlreadyInList = false;

        for (int x = 0; x < advList.length; x++) {
          if (advList[x].id == listAdverts.adverts[i1].id) {
            isAlreadyInList = true;
          }
        }

        if (!isAlreadyInList) {
          advListFromApi.add(listAdverts.adverts[i1]);
        }
      }

      advListFromApi.sort((a, b) =>
          a.creation_date_timestamp.compareTo(b.creation_date_timestamp));

      advList.addAll(advListFromApi);

    } catch (e) {
      print("Error! ${e.toString()}");
    }

    if (listAdverts != null && listAdverts.adverts.length != 0) {
      lastIndex += 100;
    }
//      requestIterator++;
//      getListAdverts(100, lastIndex);
//    } else {
    setState(() {
      isLoadingEnded = true;
      advList;
    });
//    }
  }
}
