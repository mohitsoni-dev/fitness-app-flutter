import 'package:flutter/material.dart';

Widget AnswersList(String ans) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
      child: Text(
        "$ans",
        style: TextStyle(
            fontSize: 20, letterSpacing: 1.5, fontWeight: FontWeight.w400),
      ),
    ),
  );
}
