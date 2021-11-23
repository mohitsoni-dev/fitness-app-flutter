import 'dart:convert';

import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:fitness_app_flutter/core/services/auth_service.dart';
import 'package:fitness_app_flutter/ui/views/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailOTPScreen extends StatefulWidget {
  const EmailOTPScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  _EmailOTPScreenState createState() => _EmailOTPScreenState();
}

class _EmailOTPScreenState extends State<EmailOTPScreen> {
  String otp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Colors.grey.shade200
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://firstclasse.com.my/wp-content/uploads/2020/04/Celebrity-fitness-programmes-featured.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Verification",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Please enter the OPT sent on your email address to activate your account. Check spam folder.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey.shade700, height: 1.5),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // VerificationCode(
                //   length: 6,
                //   underlineColor: Colors.blueAccent,
                //   keyboardType: TextInputType.number,
                //   onCompleted: (String text) {
                //     setState(() {
                //       otp = text;
                //     });
                //   },
                //   onEditing: (bool text) {
                //     setState(() {
                //       // otp=text;
                //     });
                //   },
                // ),
                // SizedBox(
                //   height: 30,
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 80.0, right: 80),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (String text) {
                      setState(() {
                        otp = text;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),

                ElevatedButton(
                  onPressed: () async {
                    var response = await new AuthService()
                        .activate(body: {'email': widget.email, 'code': otp});
                    print(response['message']);
                    if (response['success'] != null) {
                      addStringToSF(
                          tag: USER_JSON,
                          string: json.encode(response['user']));
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => DashBoard()));
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => DashBoard()),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 75,
                      child: Center(child: Text('Verify'))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
