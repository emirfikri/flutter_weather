import 'package:flutter/material.dart';

const lightGrey19 = Color.fromRGBO(112, 112, 112, 0.19);
BoxDecoration tileDecoration() {
  return BoxDecoration(
    color: const Color(0xFF605858),
    border: Border.all(
        color: Colors.transparent, width: 0, style: BorderStyle.solid),
    borderRadius: const BorderRadius.all(
      Radius.circular(5.0),
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.black54,
        offset: Offset(5, 5),
        blurRadius: 3,
        spreadRadius: 1,
      )
    ],
  );
}
