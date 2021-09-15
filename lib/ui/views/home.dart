import 'package:appbar_animated/appbar_animated.dart';
import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:fitness_app_flutter/ui/Widgets/drawer_body.dart';
import 'package:fitness_app_flutter/ui/widgets/workout_program_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> main_features_names = [
    "feature-1",
    "feature-2",
    "feature-3",
    "feature-4"
  ];
  String username = '';

  Future<bool> getDataFromCache() async {
    username = await getStringValuesSF(USER_NAME);
    print(username);
    return true;
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
                child: Flexible(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "User Name", //TODO
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            listViewRow("Workout", LineIcons.clock),
            listViewRow("Saved Workout", LineIcons.download),
            listViewRow("Activity", LineIcons.running),
            listViewRow("Feed", Icons.feed),
            listViewRow("Inbox", LineIcons.inbox),
            listViewRow("Settings", Icons.settings),
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
                        'Looks like it\'s a good dat to have a solid workout! Don\'t miss it!',
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
                        height: 308,
                        child: ListView(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            WorkoutProgramCard(
                              title: 'Chest Workout',
                              desc:
                                  'This workout program is design to build your chest muscles',
                            ),
                            WorkoutProgramCard(
                              title: 'Legs Workout',
                              desc:
                                  'This workout program is design to build your chest muscles',
                            ),
                            WorkoutProgramCard(
                              title: 'Arms Workout',
                              desc:
                                  'This workout program is design to build your chest muscles',
                            ),
                            WorkoutProgramCard(
                              title: 'Shoulder Workout',
                              desc:
                                  'This workout program is design to build your chest muscles',
                            ),
                          ],
                        ),
                      ),
                      PaddedDivider(),
                    ],
                  ),
                ),
              ),
            );
            // return ListView(
            //   scrollDirection: Axis.vertical,
            //   children: <Widget>[
            //     Container(
            //       height: MediaQuery.of(context).size.height / 3.5,
            //       padding: EdgeInsets.only(bottom: 10),
            //       decoration: BoxDecoration(
            //           color: Colors.black,
            //           borderRadius: BorderRadius.only(
            //               bottomLeft: Radius.circular(45),
            //               bottomRight: Radius.circular(45))),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: <Widget>[
            //           Padding(
            //             padding: const EdgeInsets.all(12.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 CircleAvatar(
            //                   radius: 28,
            //                   backgroundColor: Colors.white,
            //                   backgroundImage: NetworkImage(
            //                       'https://picsum.photos/200'), // Add the image of the user
            //                 ),
            //                 Icon(
            //                   Icons.notifications_active,
            //                   color: Colors.white,
            //                 )
            //               ],
            //             ),
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(
            //                     horizontal: 20.0, vertical: 20),
            //                 child: Text(
            //                   "Welcome,",
            //                   style:
            //                       TextStyle(color: Colors.white, fontSize: 20),
            //                 ),
            //               )
            //             ],
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(
            //                     horizontal: 20.0, vertical: 0),
            //                 child: Text(
            //                   username,
            //                   style:
            //                       TextStyle(color: Colors.white, fontSize: 30),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: 200,
            //       decoration: BoxDecoration(
            //           gradient: LinearGradient(
            //               begin: Alignment.topLeft,
            //               end: Alignment.bottomRight,
            //               colors: [
            //                 Color.fromRGBO(17, 132, 232, 10),
            //                 Color.fromRGBO(136, 199, 220, 0)
            //               ]),
            //           color: Colors.blue[100],
            //           borderRadius: BorderRadius.circular(15)),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text(
            //               "Training plans",
            //               style: TextStyle(
            //                   fontSize: 20, fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //           Row(children: [
            //             Trainingprograme(),
            //             Trainingprograme(),
            //             Trainingprograme(),
            //             Trainingprograme(),
            //           ]),
            //         ],
            //       ),
            //     ),
            //     ListView.builder(
            //         shrinkWrap: true,
            //         physics: ScrollPhysics(),
            //         itemCount: main_features_names.length,
            //         itemBuilder: (BuildContext context, index) {
            //           return Padding(
            //             padding: const EdgeInsets.all(4.0),
            //             child: InkWell(
            //               borderRadius: BorderRadius.circular(200),
            //               child: Container(
            //                 height: MediaQuery.of(context).size.height / 10,
            //                 width: MediaQuery.of(context).size.width,
            //                 child: Card(
            //                   color: Colors.pink[100],
            //                   elevation: 5,
            //                   child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.all(15.0),
            //                           child: Text(
            //                             "${main_features_names[index]}",
            //                             style: TextStyle(
            //                                 fontSize: 25,
            //                                 color: Colors.black87),
            //                           ),
            //                         ),
            //                         Center(
            //                           child: Icon(
            //                             Icons.arrow_right_outlined,
            //                             size: 100.0,
            //                           ),
            //                         ),
            //                       ]),
            //                 ),
            //               ),
            //               //TODO:feature page to be added
            //               onTap: () {},
            //             ),
            //           );
            //         })
            //   ],
            // );
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

//TODO to be fixed as horizontal scrollabe view
Widget Trainingprograme() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              //shape: BoxShape.circle,
              // border: Border.all(color: Colors.black87, width: 2),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/200"),
                  //TODO relevant images to be added images

                  fit: BoxFit.cover)),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Text(
            "Legs",
            style: TextStyle(
              fontSize: 20,
            ),
          ),

          //TODO
          onTap: () {},
        ),
      ),
    ],
  );
}

