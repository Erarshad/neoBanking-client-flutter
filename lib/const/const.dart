import 'package:flutter/material.dart';

const appName = "Expanse Manager";
const fontFamily = "Roboto";
const Color themeColor = Color(0xfffafafa);
const Color secondarythemeColor = Color(0xffea4333);
const Color anotherthemeColor = Color(0xffec6b4c);
const Color pinkColor=Color(0xffea6ca0);
EdgeInsets leftRightPadding =
    const EdgeInsets.only(left: 10.0, right: 10.0);
EdgeInsets onlyLeftPadding = const EdgeInsets.only(left: 10.0);
EdgeInsets onlyRightPadding = const EdgeInsets.only(right: 10.0);
InputBorder border = const OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(0.0),
  ),
  borderSide: BorderSide(
    color: secondarythemeColor,
    width: 1.0,
  ),
);

InputBorder errorborder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(0.0),
  ),
  borderSide: BorderSide(
    color: secondarythemeColor,
    width: 1.0,
  ),
);

//String baseUrl = "http://192.168.1.38:5000";
String baseUrl = "https://memoryreminderengine.onrender.com";
