import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:fitness_app_flutter/ui/views/dashboard.dart';
import 'package:fitness_app_flutter/ui/views/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      home: Redirector(),
    );
  }
}

class Redirector extends StatefulWidget {
  const Redirector({Key? key}) : super(key: key);

  @override
  _RedirectorState createState() => _RedirectorState();
}

class _RedirectorState extends State<Redirector> {
  bool _seen = false;
  Future<bool> checkIfSeen() async {
    _seen = await getBoolValuesSF(IS_USER_LOGGED);
    if (!_seen) {
      await addBoolToSF(tag: IS_USER_LOGGED, value: true);
    }
    return _seen;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkIfSeen(),
      builder: (BuildContext ctxt, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return _seen ? DashBoard() : WelcomeScreen();
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
