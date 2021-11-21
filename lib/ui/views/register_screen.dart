import 'package:fitness_app_flutter/core/services/auth_service.dart';
import 'package:fitness_app_flutter/ui/views/email_opt_screen.dart';
import 'package:fitness_app_flutter/ui/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_flutter/ui/widget/register_screen_widget.dart';
import 'package:fitness_app_flutter/ui/widget/header.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                    isRegister: true,
                    onSwitch: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen())),
                    onSubmit: (
                        {required String email,
                        required String password,
                        String? confirmPassword}) async {
                      String msg = '';
                      if (confirmPassword == null) {
                        msg = 'Please fill all the fields';
                      } else if (password != confirmPassword) {
                        msg = 'Passwords do not match';
                      } else {
                        bool success = await new AuthService().register(
                          body: {
                            'email': email,
                            'password': password,
                            'confirmPassword': confirmPassword,
                          },
                        );
                        if (success) {
                          msg = 'Registration succesful';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EmailOTPScreen(email: email),
                            ),
                          );
                        } else
                          msg = 'Registration failed';
                      }
                      Fluttertoast.showToast(msg: msg);
                    },
                    label2: 'Already have an account?'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
