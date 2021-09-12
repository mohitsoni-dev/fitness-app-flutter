import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class UserData extends StatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  String _name = '';
  int _age = 0;
  double _weight = 0.0;
  double _height = 0.0;
  bool loading = false;

  saveDataToSF() async {
    loading = true;
    await addStringToSF(tag: USER_NAME, string: _name);
    await addDoubleToSF(tag: USER_WEIGHT, value: _weight);
    await addDoubleToSF(tag: USER_HEIGHT, value: _height);
    await addIntToSF(tag: USER_AGE, value: _age);
    loading = false;
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Your basic information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Weight in kgs*', textAlign: TextAlign.left),
                      Container(
                        padding: EdgeInsets.only(top: 4.0),
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Weight',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Height in cms*', textAlign: TextAlign.left),
                      Container(
                        padding: EdgeInsets.only(top: 4.0),
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Height',
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
              Center(
                child: NumberPicker(
                  value: _age,
                  minValue: 0,
                  maxValue: 100,
                  step: 1,
                  itemHeight: 80,
                  axis: Axis.horizontal,
                  onChanged: (value) {
                    setState(() => _age = value);
                  },
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await saveDataToSF();
                  },
                  child: Row(
                    children: [
                      loading ? CircularProgressIndicator() : Container(),
                      Text('Save'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
