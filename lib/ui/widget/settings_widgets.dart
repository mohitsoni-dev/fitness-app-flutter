import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:line_icons/line_icons.dart';

Widget threeDotWidget() {
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.more_horiz,
        color: Colors.black,
        size: 30,
      ),
    ),
    onTap: () {}, //TODO
  );
}

Widget profilePicWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      radius: 65,
      backgroundColor: Colors.grey[300],
      child: Icon(
        LineIcons.userNinja,
        size: 55,
      ), //TODO user profile to be selected
    ),
  );
  // return Padding(
  //   padding: const EdgeInsets.all(8.0),
  //   child: Center(
  //     child: CircleAvatar(
  //       radius: 60,
  //       backgroundColor: Colors.white,
  //       backgroundImage: NetworkImage(
  //           'https://picsum.photos/200'), //TODO Add the image of the user
  //     ),
  //   ),
  // );
}

Widget userNameTextWidget(String username) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$username",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget midViewImages(String imageLink) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage('assets/$imageLink'), fit: BoxFit.fill)),
    ),
  );
}

Widget midViewCaptionTextWidget(String captionText) {
  return Text(
    "$captionText",
    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
  );
}

Widget midViewUnitsTextWidget(String unit) {
  return Text(
    "$unit",
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}

Widget midview(
    BuildContext context, String userWeight, String bmi, String userHeight) {
  return Padding(
    padding: const EdgeInsets.only(top: 25.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5.2,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, //
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              midViewImages("weight.jpg"),
              midViewImages("bmi.jpg"),
              midViewImages("height.jpg"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: midViewCaptionTextWidget("Weight"),
              ),
              midViewCaptionTextWidget("BMI calculator"),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: midViewCaptionTextWidget("Height"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 4),
                  child: midViewUnitsTextWidget("$userWeight kg")),
              Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: midViewUnitsTextWidget("$bmi kg/m2 ")),
              Padding(
                  padding: const EdgeInsets.only(right: 2.0, top: 4),
                  child: midViewUnitsTextWidget("$userHeight m")),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget DividerWidget() {
  return Divider(
    color: Colors.black,
    indent: 30,
    endIndent: 30,
    thickness: 0.2,
  );
}

Widget weeklyProgressTextWiget(String weeklyText) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "$weeklyText",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    ),
  ]);
}

Widget weeklyProgressBarWidget() {
  return Container(
    height: 150,
    //color: Colors.pinkAccent,

    //Text("Weekly progress"),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        progressBarWidget(60),
        progressBarWidget(10),
        progressBarWidget(20),
        progressBarWidget(50),
        progressBarWidget(100),
        progressBarWidget(80),
        progressBarWidget(40),
      ],
    ),
  );
}

Widget progressBarWidget(int value) {
  return FAProgressBar(
    size: 15,
    backgroundColor: Colors.black12,
    direction: Axis.vertical,
    verticalDirection: VerticalDirection.up,
    currentValue: value,
    progressColor: Colors.black,
  );
}

Widget weekdaysTextwidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      //TODO to be fixed
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Mon"),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Tue"),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Wed"),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 22.0),
        child: Text("Thu"),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Text("Fri"),
      ),
      Padding(
        padding: const EdgeInsets.only(
          right: 30.0,
        ),
        child: Text("Sat"),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: Text("Sun"),
      ),
    ],
  );
}

Widget recentExerciseViewWidget(BuildContext context) {
  return Container(
    height: 600, //color: Colors.black26,
    width: MediaQuery.of(context).size.width,
    child: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TODO recent exercise from database to be added
        recentExerciseCardWidget(context, "Leg",
            "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bring-it-all-the-way-up-here-royalty-free-image-1625750638.jpg?crop=0.601xw:0.946xh;0.397xw,0.0103xh&resize=640:*"),
        //most recent exercise
        recentExerciseCardWidget(context, "Chest ",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOte6wyEPZvnbwbrJSEpc_AnSE7Ud9IizL8g&usqp=CAU"),
        recentExerciseCardWidget(
            context, "Shoulder", "https://static.toiimg.com/photo/81355442.cms")
      ],
    ),
  );
}

Widget recentExerciseCardWidget(
    BuildContext context, String exerciseName, String imageURL) {
  return Card(
    //shadowColor: Colors.blueAccent,
    //color: Colors.pinkAccent,
    elevation: 10,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
            image: NetworkImage("$imageURL"), fit: BoxFit.cover),
      ),
      child: Center(
          child: Text(
        "$exerciseName ",
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.w400),
      )),
    ),
  );
}
