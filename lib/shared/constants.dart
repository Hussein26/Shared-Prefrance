import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar1(String x) {
  return AppBar(
    title: Text(
      x,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.grey,
    centerTitle: true,
  );
}
