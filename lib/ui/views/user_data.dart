import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class UserData extends StatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  String _name = '';
  int _age = 20;
  double _weight = 60.0;
  double _height = 170.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your basic information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 24.0),
              Text('Name', textAlign: TextAlign.left),
              SizedBox(height: 4.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Optional',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    _name = text;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Weight in kgs*', textAlign: TextAlign.left),
                      Container(
                        padding: EdgeInsets.only(top: 4.0),
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '60.0',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            setState(() {
                              _weight = double.parse(text);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Height in cms*', textAlign: TextAlign.left),
                      Container(
                        padding: EdgeInsets.only(top: 4.0),
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '174.0',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            setState(() {
                              _height = double.parse(text);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text('Age*', textAlign: TextAlign.left),
              SizedBox(height: 4.0),
              NumberPicker(
                value: _age,
                minValue: 0,
                maxValue: 100,
                step: 1,
                itemHeight: 80,
                axis: Axis.horizontal,
                onChanged: (value) => setState(() => _age = value),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
