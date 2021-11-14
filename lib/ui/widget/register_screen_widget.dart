import 'package:fitness_app_flutter/ui/widget/button.dart';
import 'package:flutter/material.dart';

class InputWrapper extends StatelessWidget {
  const InputWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputField(),
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            child: Text(
              "Forget Password",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            child: Button(),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}


class InputField extends StatelessWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: TextField(

              decoration: InputDecoration(
                  hintText: "Enter your password",

                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none),
            ),
          ),

        ],


      ),
    );
  }
}
