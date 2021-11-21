import 'package:fitness_app_flutter/ui/widget/question_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPostAnswers extends StatelessWidget {
  const CommunityPostAnswers(
      {Key? key,
      required this.question,
      required this.expertAnswer,
      required this.answers})
      : super(key: key);

  final String question;
  final String expertAnswer;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(100,194, 233, 251),Color.fromARGB(100, 161, 196, 253),]
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
                  child: Text(
                    "$question ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(indent: 30, endIndent: 30, thickness: 1.5),
              SizedBox(height: 20),
              SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                        child: Text(
                          "Expert's view:",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                      child: Text(
                        "$expertAnswer",
                        style: TextStyle(
                            fontSize: 22,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(indent: 50, endIndent: 50, thickness: 1.5),
                  SizedBox(height: 5),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                        child: Text(
                          "Other Answers:",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[for (var i in answers) AnswersList(i)],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
