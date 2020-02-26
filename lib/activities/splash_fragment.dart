import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';

class SplashFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    checkConnection(context);

    return Stack(children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          body: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/logo.png'
                ),
                padding: EdgeInsets.fromLTRB(0, 100, 0, 150),
              ),
              Center(
                child: Text(
                  'Коммерческая недвижимость в Украине',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300, fontSize: 36),
                ),
              ),
            ],
          ),
        ),

      ]);
  }

  void _runNext(BuildContext context) {
    if (MyApp.categoryCollector.getCategories().length > 0) {
      Navigator.of(context).pushReplacementNamed("fragment2");
    } else {
      const twentyMillis = const Duration(milliseconds: 3000);
      new Timer(twentyMillis, () => _runNext(context));
    }
  }

  Future checkConnection(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _runNext(context);
      }
    } on SocketException catch (_) {
      Fluttertoast.showToast(
          msg: "Отсутствует интренет соединение, поробуйте позже",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}
