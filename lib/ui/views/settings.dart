import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:fitness_app_flutter/ui/views/about_us.dart';
import 'package:fitness_app_flutter/ui/views/register_screen.dart';
import 'package:fitness_app_flutter/ui/views/sleep_asmr.dart';
import 'package:fitness_app_flutter/ui/widget/settings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String choice) async {
              if (choice == 'About us') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              } else if (choice == 'Sign Out') {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.clear();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => RegisterScreen(),
                  ),
                      (route) => false,
                );

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => RegisterScreen()));
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
            String bmi = (userWeight / (userHeight * userHeight)).toString();
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  profilePicWidget(),
                  userNameTextWidget(userName, context),

                  midview(context, userWeight.toString(),
                      bmi.toString().substring(0, 3), userHeight.toString()),
                  DividerWidget(),
                  //weeklyProgressTextWiget("Weekly Progress"),
                  //weeklyProgressBarWidget(),
                 // weekdaysTextwidget(),
                  DividerWidget(),
                  weeklyProgressTextWiget("Popular Exercise"),
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
