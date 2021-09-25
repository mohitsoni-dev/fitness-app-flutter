import 'package:fitness_app_flutter/ui/widgets/explore_body.dart';
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
          mainAxisSize:MainAxisSize.min,
          children: [
            Container(
              height: 75,
              width: MediaQuery.of(context).size.width,alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Your Daily Health News",softWrap: false,
                  maxLines: 2,
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
