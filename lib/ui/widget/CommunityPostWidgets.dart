import 'package:fitness_app_flutter/core/models/question.dart';
import 'package:fitness_app_flutter/ui/views/Question_detail.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

Widget textFieldView(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
    child: Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search Post",
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: Icon(Icons.search),
            focusColor: Colors.black,
            hoverColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
            ),
            contentPadding: EdgeInsets.all(8)),
        onSubmitted: (value) {}, //TODO
      ),
    ),
  );
}

class PostOfCommunity extends StatefulWidget {
  const PostOfCommunity({Key? key, this.question}) : super(key: key);
  final Question? question;

  @override
  _PostOfCommunityState createState() => _PostOfCommunityState();
}

class _PostOfCommunityState extends State<PostOfCommunity> {
  int _upVote = 0;
  int _downVote = 0;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Colors.black,
            endIndent: 18,
            indent: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 12, right: 12),
            child: Text(
              widget.question!.question,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      text: widget.question!.desc,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "read more",
                          style: TextStyle(color: Colors.blue),
                        )
                      ]),
                ),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommunityPostAnswers(
                        question: widget.question!.question,
                        expertAnswer: widget.question!.answer.expertAns,
                        answers: widget.question!.answer.answers,
                      ))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Icon(
                        LineIcons.thumbsUp,
                        size: 30,
                      ),
                      onTap: ()  {
                      setState(() {
                      _upVote++;
                      });
                    }


                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$_upVote",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Icon(
                        LineIcons.thumbsDown,
                        size: 30,
                      ),
                      onTap: (){
                        setState(() {

                            _downVote++;

                        });

                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("$_downVote",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.report,
                  color: Colors.red[600],
                ),
                onTap: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}

