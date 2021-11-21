import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:fitness_app_flutter/ui/views/home.dart';
import 'package:fitness_app_flutter/ui/views/sleep_asmr.dart';
import 'package:fitness_app_flutter/ui/widget/settings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String userName = "";
  double userHeight = 0.0;
  double userWeight = 0.0;

  Future<bool> getDataFromCache() async {
    userName = await getStringValuesSF(USER_NAME);
    userHeight = await getDoubleValuesSF(USER_HEIGHT);
    userWeight = await getDoubleValuesSF(USER_WEIGHT);
    print(userName);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: [
          PopupMenuButton<String>(
            onSelected: (
              String choice,
            ) {
              if (choice == 'About us') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              } else if (choice == 'Sign Out') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SleepAsmr()));
              }
            },
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: 30,
            ),
            itemBuilder: (BuildContext context) {
              return AboutConst.choice.map((String choices) {
                return PopupMenuItem<String>(
                  value: choices,
                  child: Text(choices),
                );
              }).toList();
            },
          ),
          //threeDotWidget(),
        ],
      ),
      body: FutureBuilder(
        future: getDataFromCache(),
        builder: (BuildContext ctxt, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            String bmi = (userWeight / userHeight * userHeight).toString();
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  profilePicWidget(),

                  userNameTextWidget("$userName"),
                  //TODO values to be added from database
                  midview(context, userWeight.toString(),
                      bmi.toString().substring(0, 3), userHeight.toString()),
                  DividerWidget(),
                  weeklyProgressTextWiget("Weekly Progress"),
                  //TODO progress value to be added from database
                  weeklyProgressBarWidget(),
                  //TODO Recent seven days of the week to be added from database
                  weekdaysTextwidget(),
                  DividerWidget(),
                  weeklyProgressTextWiget("Recent Exercise"),
                  //TODO recent exercise from database to be added
                  recentExerciseViewWidget(context)
                  //
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class AboutConst {
  static const String About = "About us";
  static const String Signout = "Sign Out";
  static const List<String> choice = <String>[About, Signout];
}
