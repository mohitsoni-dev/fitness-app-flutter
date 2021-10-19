import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AskQuestion extends StatefulWidget {
  const AskQuestion({Key? key}) : super(key: key);

  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  List<bool> isSelected = [true, false];

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
                    // const TextField(
                    //   decoration: InputDecoration(
                    //     hintText: 'New todo',
                    //     border: InputBorder.none,
                    //   ),
                    //   cursorColor: Colors.white,
                    // ),
                    Text(
                      "Ask your question",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                     TextField(
                      showCursor: true,
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        hintText: ' Question Title',
                        border: InputBorder.none,

                      ),
                      //maxLines: 1,
                    ),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.2,
                    ),

                     TextField(
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

                    Container(
                      color: Colors.white,
                      child: ToggleButtons(
                        isSelected: isSelected,
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
                        onPressed: (int SelectedIndex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected.length;
                                index++) {
                              if (SelectedIndex == index) {
                                isSelected[index] = true;
                              } else {
                                isSelected[index] = false;
                              }
                            }
                          });
                        },
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "(*make post private or public)",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg:
                              "When an expert answers your question it will appear here",
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT,
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
