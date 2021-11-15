import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key, this.label}) : super(key: key);
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              label!,
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "Welcome to Flex App",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
