import 'dart:convert';

import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:fitness_app_flutter/core/services/auth_service.dart';
import 'package:fitness_app_flutter/ui/views/dashboard.dart';
import 'package:fitness_app_flutter/ui/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_flutter/ui/widget/register_screen_widget.dart';
import 'package:fitness_app_flutter/ui/widget/header.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            Header(label: 'Login'),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                    )),
                child: InputWrapper(
                    isRegister: false,
                    onSwitch: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        ),
                    onSubmit: (
                        {required String email,
                        required String password,
                        String? confirmPassword}) async {
                      dynamic response = await new AuthService()
                          .login(body: {'email': email, 'password': password});
                      if (!response['error']) {
                        addStringToSF(
                            tag: USER_JSON, string: json.encode(response['user']));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => DashBoard()),
                        );
                      } else {
                        Fluttertoast.showToast(msg: response['message']);
                      }
                    },
                    label1: 'Forgot Password',
                    label2: 'Create New Account'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
