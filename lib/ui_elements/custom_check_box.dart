import 'package:flutter/material.dart';

class CustomImageChecbox extends StatefulWidget {
  @override
  CustomImageChecboxState createState() {
    return new CustomImageChecboxState();
  }
}

class CustomImageChecboxState extends State<CustomImageChecbox> {
  bool _isChecked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 0.0, vertical: 0.0),
          child: GestureDetector(
            child: Radio(
            value: _isChecked,
            onChanged: (bool val) =>
                setState(() => _isChecked = ! _isChecked),
          ),
          ),
        ),
        SizedBox(width: 24.0),
      ],
    );
  }
}