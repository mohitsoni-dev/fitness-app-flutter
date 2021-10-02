import 'package:fitness_app_flutter/ui/widgets/CommunityPostWidgets.dart';
import 'package:flutter/material.dart';


class CommunityPost extends StatefulWidget {
  const CommunityPost({Key? key}) : super(key: key);

  @override
  _CommunityPostState createState() => _CommunityPostState();
}

class _CommunityPostState extends State<CommunityPost> {
  int _upVote = 0;
  int _downVote = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            textFieldView(context), //todo search bar algorithm to made
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  PostOfCommunity(),
                  PostOfCommunity(),
                  PostOfCommunity(),
                  PostOfCommunity(),
                  PostOfCommunity()

                ],
              ),
            ))
          ],
        ),
        floatingActionButton: Align(
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          alignment: Alignment(1, 0.7),
        ));
  }
}








