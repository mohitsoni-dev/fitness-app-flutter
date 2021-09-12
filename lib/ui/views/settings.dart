import 'package:fitness_app_flutter/ui/Widgets/settings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          threeDotWidget(),
          //TODO profile pic to be added
          profilePicWidget(),
          //TODO user name to be added
          userNameTextWidget("User Name"),
          //TODO values to be added from database
          midview(context),
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
  }
}
