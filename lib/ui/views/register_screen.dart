import 'package:fitness_app_flutter/ui/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_flutter/ui/widget/register_screen_widget.dart';
import 'package:fitness_app_flutter/ui/widget/header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color.fromARGB(255, 0, 188, 212),
            Color.fromARGB(255, 77, 208, 225),
            Color.fromARGB(255, 38, 198, 218)
          ]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Header(label: 'Register'),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60),
                  ),
                ),
                child: InputWrapper(
                    onSwitch: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen())),
                    onSubmit: () {},
                    label2: 'Already have an account?'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
