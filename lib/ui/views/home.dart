import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<String> main_features_names = [
    "Workout Program",
    "Workout History",
    "Weight History",
    "BMI Calculator"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/200'), // Add the image of the user
                        ),
                        Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Text(
                          "Welcome,",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 0),
                        child: Text(
                          "User Name",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: main_features_names.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      InkWell(
                        child: Container(
                          //height: MediaQuery.of(context).size.height ,
                          //width: MediaQuery.of(context).size.width,
                          //color: Colors.pinkAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 10,
                              child: Text("${main_features_names[index]}"),
                            ),
                          ),
                        ),
                        onTap: () {},
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
