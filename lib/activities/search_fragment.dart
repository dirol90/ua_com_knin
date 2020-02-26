import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ua_com_knin/models/City.dart';
import 'package:ua_com_knin/models/Types.dart';
import 'package:ua_com_knin/ui_elements/body_search.dart';
import 'package:ua_com_knin/ui_elements/bottom_search_bar.dart';

class SearchFragment extends StatelessWidget {

  final City city;
  final Types type;

  SearchFragment({this.city, this.type}): super ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0185D4),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 8.0),
                child: Text('KNIN.COM.UA',
                    style: TextStyle(
                        color: Colors.white))),
          ],
        ),
      ),
      body: MyBodySearch(city, type),
      bottomNavigationBar: MyBottomBarSearch(0),
    );
  }
}
