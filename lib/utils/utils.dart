import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
    backgroundColor:  Colors.grey,
    fontSize: 20.0,
  );
}