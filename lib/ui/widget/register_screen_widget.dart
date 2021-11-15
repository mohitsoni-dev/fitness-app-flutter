import 'package:fitness_app_flutter/ui/widget/button.dart';
import 'package:flutter/material.dart';

class InputWrapper extends StatefulWidget {
  const InputWrapper({
    Key? key,
    required this.onSwitch,
    required this.onSubmit,
    this.label1,
    this.label2,
  }) : super(key: key);
  final Function onSwitch;
  final Function onSubmit;
  final String? label1;
  final String? label2;

  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  String email = '';
  String password = '';
  bool isEmailValid = true;

  void checkIfEmailIsValid() {
    setState(() {
      isEmailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputField(
              isEmailValid: isEmailValid,
              onEmailChanged: (String e) {
                setState(() {
                  email = e;
                });
                checkIfEmailIsValid();
              },
              onPasswordChanged: (String p) {
                setState(() {
                  password = p;
                });
              },
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.label1 != null
                  ? InkWell(
                      child: Text(
                        widget.label1!,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onTap: () {},
                    )
                  : Container(),
              InkWell(
                child: Text(
                  widget.label2!,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  widget.onSwitch();
                },
              ),
            ],
          ),
          SizedBox(height: 30),
          InkWell(
            child: Button(),
            onTap: () {
              widget.onSubmit(email: email, password: password);
            },
          ),
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.isEmailValid,
  }) : super(key: key);

  final Function onEmailChanged;
  final bool isEmailValid;
  final Function onPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (String text) => onEmailChanged(text),
              decoration: InputDecoration(
                hintText: "Enter your Email",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Please enter a valid email address',
            style: TextStyle(color: isEmailValid ? Colors.white : Colors.red),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: TextField(
              onChanged: (String text) => onPasswordChanged(text),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
