import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  Function action;
  String text;
  Color color;
  CustomRoundedButton({this.text, this.action, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20, top: 10),
      child: FlatButton(
          onPressed: action,
          child: Container(
              width: double.infinity,
              height: 48,
              child: Center(
                  child: Text(
                text,
                style: TextStyle(
                    color: Color(0xffFCFCFC),
                    fontFamily: 'NotoSans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ))),
          color: color,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(12.0))),
    );
  }
}
