import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('About Privacy Guide'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 50.0,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SizedBox(width: 10.0),
                      Text(
                        'Flex',
                        style: TextStyle(fontSize: 36),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.blue.shade700,
                    thickness: 1.2,
                    endIndent: 30,
                    indent: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.infoCircle,
                                color: Colors.grey.shade900,
                                size: 35,
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                'Version v1.0.0',
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.blue.shade700,
                          thickness: 1.2,
                          endIndent: 30,
                          indent: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.code,
                                size: 35,
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              InkWell(
                                child: Text(
                                  'Source Code',
                                  style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontSize: 25),
                                ),
                                onTap: () => launch(
                                    'https://github.com/mohitsoni-dev/fitness-app-flutter'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFADD8E6),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),

                    child: Column(
                      children: [
                        Text(
                          'Developers',
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                FontAwesomeIcons.github,
                              ),
                              Text('Mohit Soni',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              InkWell(
                                child: Text(
                                  'GITHUB',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onTap: () {
                                  launch('https://github.com/mohitsoni-dev');
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.blue.shade700,
                          thickness: 1.2,
                          endIndent: 30,
                          indent: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                FontAwesomeIcons.github,
                              ),
                              Text('Sushant Kumar',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              InkWell(
                                child: Text(
                                  'GITHUB',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onTap: () {
                                  launch('https://github.com/sushantkumar09');
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.blue.shade700,
                          thickness: 1.2,
                          endIndent: 30,
                          indent: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                FontAwesomeIcons.github,
                              ),
                              Text('Shivam Yadav',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              InkWell(
                                child: Text(
                                  'GITHUB',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onTap: () {
                                  launch('https://github.com/mohitsoni-dev');
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.blue.shade700,
                          thickness: 1.2,
                          endIndent: 30,
                          indent: 30,
                        ),
                      ],
                    ),
                    //color: Color(0xFF2F394D),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),

                    child: Column(
                      children: [
                        Text(
                          'MIT LICENSE',
                          style: TextStyle(fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                              child: InkWell(
                            child: Text(
                              "https://github.com/mohitsoni-dev/fitness-app-flutter/blob/master/LICENSE",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
                            ),
                            onTap: () {
                              launch(
                                  'https://github.com/mohitsoni-dev/fitness-app-flutter/blob/master/LICENSE');
                            },
                          )),
                        ),
                      ],
                    ),
                    //color: Color(0xFF2F394D),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({required this.color, required this.child, required this.height});

  final Color color;
  final Widget child;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
    );
  }
}
