import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Politics extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:  Color(0xff0185D4),
          title: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 8.0),
                  child: Text('', style: TextStyle(color: Colors.black))),
            ],
          ),
        ),
      body: Container(
        child: Column(children: <Widget>[
          Expanded(flex: 9, child: ListView(
            children: <Widget>[
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident'),
        ],
      ),),
          Expanded(flex: 1, child: _roundedButton(context, 'Я согласен(на)', 24, Color(0xff08A233)),),
        ],),

      ),
    );
  }

  Widget _roundedButton(
      BuildContext context, String text, double textSize, color) {
    return Container(
//        color: Colors.green,
        child: Container(
          margin:
          const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
          decoration: new BoxDecoration(
            color: color,
            border: new Border.all(color: Colors.white10, width: 2.0),
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: new Center(
            child: new Text(
              text,
              style: new TextStyle(fontSize: textSize, color: Colors.black),
            ),
          ),
        ));
  }

}