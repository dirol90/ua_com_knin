import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ua_com_knin/helper/ApiHelper.dart';
import 'package:ua_com_knin/models/Advert.dart';
import 'package:ua_com_knin/models/Post.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ad_politics.dart';

class AdOrderDialog extends StatelessWidget {
//  var id = 2525;
  Advert advert;

  AdOrderDialog(this.advert);

  @override
  Widget build(BuildContext context) {
    final myControllerName = TextEditingController();
    final myControllerPhone = TextEditingController();
    var tbName = _editTextBlock(context, false, 'Имя', '', 1, myControllerName);
    var tbPhone =
        _editTextBlock(context, false, 'Телефон', '', 1, myControllerPhone);

    return AlertDialog(
      title: Text('Вы хотите отправить заявку на ID ${advert.id}'),
      content: SizedBox(
        width: 200.0,
        height: 300.0,
        child: Card(
          child: Column(
            children: <Widget>[
              tbName,
              tbPhone,
              GestureDetector(
                onTap: () {
                  _launchURL();
                },
                child: Text('Политика конфиденциальности'),
              ),
              GestureDetector(
                onTap: () async {

//                  Fluttertoast.showToast(
//                      msg: "OK PRINT ID ${advert.id} , NAME ${myControllerName.text}, PHONE ${myControllerPhone.text}",
//                      toastLength: Toast.LENGTH_SHORT,
//                      gravity: ToastGravity.CENTER,
//                      timeInSecForIos: 1,
//                      backgroundColor: Colors.grey,
//                      textColor: Colors.black,
//                      fontSize: 16.0);

                  Navigator.pop(context, this);

                  var newPost = new Post(
                      name: myControllerName.text,
                      phone: myControllerPhone.text,
                      realty_id: advert.id);
                      await ApiHelper().createPost(newPost.toMap());
                },
                child: _roundedButton(
                    context, 'Отправить заявку', 20, Color(0xff08A233)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _editTextBlock(BuildContext context, bool withIcon, String text,
      String str, int countOfEditText, TextEditingController tec) {
    return Container(
        margin: const EdgeInsets.only(
            left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 10.0),
                child: Text(text, textAlign: TextAlign.left),
              ),
              SizedBox(
                height: 40.0,
                child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    controller: tec,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
//                          prefixIcon: Icon(Icons.edit_location)
                    )),
              )
            ]));
  }

  Widget _roundedButton(
      BuildContext context, String text, double textSize, color) {
    return Container(
        height: 50,
//        color: Colors.green,
        child: Container(
          margin: const EdgeInsets.only(
              left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
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

  _launchURL() async {
    const url = 'http://knin.com.ua/articles/politika-konfidentsialnosti-sayta-knincomua-110';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
