import 'package:fitness_app_flutter/core/services/auth_service.dart';
import 'package:fitness_app_flutter/ui/views/dashboard.dart';
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
        child: Column(
          children: [
            Text(
                'You have received an OPT on your email address. Enter it to activate your account. Check spam folder.'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (String text) {
                setState(() {
                  otp = text;
                });
                print(otp + widget.email);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                var response = await new AuthService()
                    .activate(body: {'email': widget.email, 'code': otp});
                print(response['message']);
                if (response['success'] != null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DashBoard()));
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}