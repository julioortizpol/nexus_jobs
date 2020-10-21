import 'package:flutter/material.dart';

//Colors//0xffa6a0f3
Color grayBackGround = Color(0xffEDF1F7);
Color txtFieldUnderLineColor = Color.fromARGB(100, 167, 161, 243);
Color txtFieldContentColor = Color(0xffA7A1F3);
Color darkBlue = Color(0xff133463);
Color mainColor = Color(0xff483EE8);
Color darkGray = Color(0xffCFCFCF);

//BoxDecorations
BoxDecoration customBoxDecoration(radius, Color color) {
  return BoxDecoration(
    color: color,
    border: Border.all(
      color: color,
    ),
    borderRadius: BorderRadius.circular(radius),
  );
}

//TextStyles
TextStyle txtFieldLabels =
    TextStyle(fontFamily: "Nunito-SemiBold", fontSize: 18.0, color: mainColor);

TextStyle txtFieldContent =
    TextStyle(color: txtFieldContentColor, fontFamily: 'Nunito', fontSize: 18);

TextStyle forgotPassWordButton = TextStyle(
    color: darkBlue,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    fontFamily: 'NotoSans');

TextStyle loginButtonLabel = TextStyle(
    color: Color(0xffFCFCFC),
    fontFamily: 'NotoSans',
    fontWeight: FontWeight.w600,
    fontSize: 16);

//InputDecoration
InputDecoration loginInputDecoration = InputDecoration(
  isCollapsed: true,
  contentPadding: EdgeInsets.symmetric(vertical: 4),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: txtFieldUnderLineColor),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: txtFieldUnderLineColor),
  ),
);
