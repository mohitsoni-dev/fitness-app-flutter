import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AskQuestion extends StatefulWidget {
  const AskQuestion({Key? key, this.onSubmit}) : super(key: key);
  final dynamic Function({
  required String desc,
  bool isPrivate,
  required String title,
  })? onSubmit;

  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  bool isPrivate = true;
  String title = '';
  String desc = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "",
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ask your question",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Divider(color: Colors.white, thickness: 0.2),
                    TextField(
                      onChanged: (String text) {
                        setState(() {
                          title = text;
                        });
                      },
                      showCursor: true,
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        hintText: ' Question Title',
                        border: InputBorder.none,
                      ),
                      maxLines: 2,
                    ),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.2,
                    ),
                    TextField(
                      onChanged: (String text) {
                        setState(() {
                          desc = text;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: ' Description',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      showCursor: true,
                      cursorColor: Colors.black26,
                    ),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.2,
                      endIndent: 30,
                      indent: 30,
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      color: Colors.white,
                      child: ToggleButtons(
                        isSelected: [isPrivate, !isPrivate],
                        selectedColor: Colors.black87,
                        splashColor: Colors.green[200],
                        //selectedBorderColor: Colors.green,
                        renderBorder: false,
                        fillColor: Colors.green[200],
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Private",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Public",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                        onPressed: (int selectedIndex) {
                          setState(() {
                            if (selectedIndex == 0)
                              isPrivate = true;
                            else
                              isPrivate = false;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "*select private to hide your identity",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (title.isEmpty || desc.isEmpty) {
                          Fluttertoast.showToast(
                            msg:
                            "Please enter title and description for your query.",
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_LONG,
                          );
                          return;
                        }
                        widget.onSubmit!(
                            title: title, desc: desc, isPrivate: isPrivate);
                        Fluttertoast.showToast(
                          msg:
                          "When an expert answers your question it will appear here",
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_LONG,
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Ask'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}