import 'package:fitness_app_flutter/ui/views/sleep_asmr.dart';
import 'package:flutter/material.dart';

Widget listViewRow(
  String feature,
  IconData icon,
  BuildContext context,
  int n,
) {
  return ListTile(
    leading: Icon(icon, size: 25),
    title: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          '$feature',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )),
    onTap: () {
      if (n == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SleepAsmr()));
      }
      // Update the state of the app.
      // ...
    },
  );
}
