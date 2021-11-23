import 'dart:math';

import 'package:appbar_animated/appbar_animated.dart';
import 'package:fitness_app_flutter/constants/constants.dart';
import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:fitness_app_flutter/core/data/workouts_data.dart';
import 'package:fitness_app_flutter/ui/widget/drawer_body.dart';
import 'package:fitness_app_flutter/ui/widget/workout_program_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';
  String userLastSeen = '';
  double streak = 0;

  Future<bool> getDataFromCache() async {
    username = await getStringValuesSF(USER_NAME);
    userLastSeen = await getStringValuesSF(USER_LAST_DATE);
    streak = await getDoubleValuesSF(USER_STREAK);

    print(username);
    return true;
  }

  addDataToCache() async {
    addStringToSF(tag: USER_LAST_DATE, string: userLastSeen);
    addDoubleToSF(tag: USER_STREAK, value: streak);
  }

  int toInt(String s) {
    int number = 0;
    try {
      number = int.parse(s);
    } on FormatException {
      print('Format error!');
    }

    return number;
  }

  bool isLeapYear(var year) {
    if (year % 400 == 0) return true;
    if (year % 100 == 0) return false;
    if (year % 4 == 0) return true;
    return false;
  }

  var now = DateTime.now();
  var yearFormat = DateFormat('yyyy');
  var monthFormat = DateFormat('MM');
  var dayFormat = DateFormat('dd');

  DayOfTheYear(var month, var day, var year) {
    // like 1 jan=1,10 jan =10,10 oct =294 etc
    int monthIndex = month - 1;
    var dayCount = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    var dayOfYear = dayCount[monthIndex] + day;
    if (monthIndex > 1 && isLeapYear(year)) dayOfYear++;
    return dayOfYear;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromCache();
    var currentYear = yearFormat.format(now);
    var currentMonth = monthFormat.format(now);
    var currentDay = dayFormat.format(now);

    var noOfDaysInYear = isLeapYear(toInt(currentYear)) ? 366 : 365;
    var dayNo = DayOfTheYear(
        toInt(currentMonth), toInt(currentDay), toInt(currentYear));

    if (userLastSeen == '') {
      streak = 1;
    } else {
      if (toInt(userLastSeen) % noOfDaysInYear - dayNo == 1) {
        streak++;
      } else if (toInt(userLastSeen) % noOfDaysInYear - dayNo > 1) {
        streak = 0;
      }
    }
    userLastSeen = dayNo.toString();

    addDataToCache();
    debugPrint("$streak");
  }

  final ColorTween background = ColorTween(
    begin: Colors.transparent,
    end: Colors.blue,
  );
  final ColorTween text = ColorTween(
    begin: Colors.white,
    end: Colors.black,
  );

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<String> quote = kQuotes[new Random().nextInt(6)];
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  ),
              child: Container(
                //alignment: Alignment.centerLeft,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          LineIcons.userNinja,
                          size: 35,
                        ), //TODO user profile to be selected
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " $username",
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            listViewRow("Workout", LineIcons.clock, context, 0),
            listViewRow("Saved Workout", LineIcons.download, context, 1),
            listViewRow(
              "Streak-$streak",
              LineIcons.fire,
              context,
              2,
            ),
            listViewRow("Sleep Asmr", LineIcons.peace, context, 3),
            listViewRow("Inbox", LineIcons.inbox, context, 4),
            listViewRow("Settings", Icons.settings, context, 5),
          ],
        ),
      ),
      body: FutureBuilder(
        future: getDataFromCache(),
        builder: (BuildContext ctxt, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return AppBarColorAnimated(
              backgroundColor: background,
              color: text,
              appBarBuilder: _appBar,
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 95.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back, $username 👋',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'Looks like it\'s a good day to have a solid workout! Don\'t miss it!',
                        style: TextStyle(fontSize: 13),
                      ),
                      PaddedDivider(),
                      Text(
                        'WORKOUT PROGRAMS',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(
                        height: 320,
                        child: ListView(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            WorkoutProgramCard(
                              title: 'Chest Workout',
                              desc:
                                  'This workout program is design to build your chest muscles',
                              workoutList: chest_workouts,
                              image:
                                  'https://images.unsplash.com/photo-1579047172169-515291e29467?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
                            ),
                            WorkoutProgramCard(
                              title: 'Legs Workout',
                              desc:
                                  'This workout program is design to build your legs muscles',
                              workoutList: legs_workouts,
                              image:
                                  'https://images.unsplash.com/photo-1434608519344-49d77a699e1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80',
                            ),
                            WorkoutProgramCard(
                              title: 'Arms Workout',
                              desc:
                                  'This workout program is design to build your arms muscles',
                              workoutList: arms_workouts,
                              image:
                                  'https://images.unsplash.com/photo-1590507621108-433608c97823?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                            ),
                            WorkoutProgramCard(
                              title: 'Back Workout',
                              desc:
                                  'This workout program is design to build your back muscles',
                              workoutList: shoulder_workouts,
                              image:
                                  'https://images.unsplash.com/photo-1600677396360-9c4e8e46e7d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
                            ),
                          ],
                        ),
                      ),
                      PaddedDivider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4.0),
                            Text(
                              '\"${quote[0]}\"',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '- ' + quote[1],
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _appBar(context, bgColor, color) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(LineIcons.bellAlt, color: Colors.black),
        ),
      ],
      backgroundColor: bgColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.menu,
          size: 30,
          color: Colors.black,
        ),
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
      ),
    );
  }
}

class PaddedDivider extends StatelessWidget {
  const PaddedDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.0),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
