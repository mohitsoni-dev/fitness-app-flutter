import 'package:fitness_app_flutter/ui/Widgets/explore_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore more"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 75,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Your Daily Health News",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            feedSection(context),
            Divider(
              thickness: 1,
            ),
            feedSection(context),
            Divider(
              thickness: 1,
            ),
            feedSection(context),
            Divider(
              thickness: 1,
            ),
            feedSection(context),
            Divider(
              thickness: 1,
            ),
            feedSection(context),
            Divider(
              thickness: 1,
            ),
            feedSection(context),
          ],
        ),
      ),
    );
  }
}
