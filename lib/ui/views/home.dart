import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<String> main_features_names = [
    "feature-1",
    "feature-2",
    "feature-3",
    "feature-4"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(17, 132, 232, 10),
                      Color.fromRGBO(136, 199, 220, 0)
                    ]),
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Training plans",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(children: [
                  Trainingprograme(),
                  Trainingprograme(),
                  Trainingprograme(),
                  Trainingprograme(),
                ]),
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: main_features_names.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(200),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.pink[100],
                        elevation: 5,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "${main_features_names[index]}",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black87),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.arrow_right_outlined,
                                  size: 100.0,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    //TODO:feature page to be added
                    onTap: () {},
                  ),
                );
              })
        ],
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