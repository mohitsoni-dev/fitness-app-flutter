import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getDataFromCache(),
          builder: (BuildContext ctxt, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      onPressed: () => scaffoldKey.currentState!.openDrawer(),
                    ),
                    Text('Welcome back, $username 👋'),
                  ],
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
      ),
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
