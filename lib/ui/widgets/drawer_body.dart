import 'package:flutter/material.dart';

Widget listViewRow(String feature, IconData icon) {
  return ListTile(
    leading: Icon(
      icon,
      size: 25,
    ),
    title: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          '$feature',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )),
    onTap: () {
      // Update the state of the app.
      // ...
    },
  );
}
