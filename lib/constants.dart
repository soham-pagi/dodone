import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF3FBAC2);
const kSecondaryColor = Color(0xFFD3D4D8);
const kBorderSideColor = Color(0xFF11BFAE);
const kRedColor = Colors.red;

// shape
const kRoundBorderShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),);

// font
const kSmallFontStyle = TextStyle(fontSize: 18.0);
const kDefaultFontStyle = TextStyle(fontSize: 20.0);
const kPrimaryFontStyle = TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 19.0);
const kDialogTitleStyle = TextStyle(fontSize: 22.0, color: kPrimaryColor, fontWeight: FontWeight.bold);
const kDefaultDialogButtonStyle = TextStyle(fontSize: 19.0, color: kPrimaryColor);

// button style
var kDialogButtonStyle = TextButton.styleFrom(foregroundColor: kPrimaryColor);
var kDialogDangerButtonStyle = TextButton.styleFrom(foregroundColor: kRedColor);