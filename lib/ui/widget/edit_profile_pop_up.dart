import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String name = '';
  double height = 0.0;
  double weight = 0.0;
  int age = 20;
  String goal = 'Lose weight';
  String diet = 'Standard';

  // Future<bool> _getData() async {
  //   name = await getStringValuesSF(USER_NAME);
  //   height = await getDoubleValuesSF(USER_HEIGHT);
  //   weight = await getDoubleValuesSF(USER_WEIGHT);
  //   age = await getIntValuesSF(USER_AGE);
  //   // goal = await getStringValuesSF(USER_GOAL);
  //   // diet = await getStringValuesSF(USER_DIET);
  //   return true;
  // }

  saveData({
    required String n,
    required String g,
    required double h,
    required double w,
    required String d,
    required int a,
  }) async {
    await addStringToSF(tag: USER_DIET, string: d);
    await addStringToSF(tag: USER_NAME, string: n);
    await addStringToSF(tag: USER_GOAL, string: g);
    await addIntToSF(tag: USER_AGE, value: a);
    await addDoubleToSF(tag: USER_WEIGHT, value: w);
    await addDoubleToSF(tag: USER_HEIGHT, value: h);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "",
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Edit your profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const Divider(color: Colors.white, thickness: 0.2),
                    TextField(
                      onChanged: (String text) {
                        setState(() {
                          name = text;
                        });
                      },
                      showCursor: true,
                      cursorColor: Colors.black26,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Name',
                        hintText: ' $name',
                      ),
                    ),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.2,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (String text) {
                        setState(() {
                          weight = double.parse(text);
                        });
                      },
                      decoration: InputDecoration(
                        hintText: ' $weight',
                        labelText: 'Weight',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      showCursor: true,
                      cursorColor: Colors.black26,
                    ),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.2,
                      endIndent: 30,
                      indent: 30,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (String text) {
                        setState(() {
                          height = double.parse(text);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Height',
                        hintText: ' $height',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      showCursor: true,
                      cursorColor: Colors.black26,
                    ),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.2,
                      endIndent: 30,
                      indent: 30,
                    ),
                    // age
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (String text) {
                        setState(() {
                          age = int.parse(text);
                        });
                      },
                      decoration: InputDecoration(
                        hintText: ' $age',
                        labelText: 'Age',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      showCursor: true,
                      cursorColor: Colors.black26,
                    ),
                    const Divider(
                      color: Colors.black26,
                      thickness: 0.2,
                      endIndent: 30,
                      indent: 30,
                    ),
                    // goal
                    Text('Goal preference:'),
                    SizedBox(height: 4.0),
                    DropdownButton<String>(
                      items: <String>[
                        'Lose weight',
                        'Get fitter',
                        'Gain muscle'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? g) {
                        setState(() {
                          goal = g ?? '';
                        });
                      },
                      value: goal,
                    ),
                    // diet
                    Text('Diet preference:'),
                    SizedBox(height: 4.0),
                    DropdownButton<String>(
                      items: <String>[
                        'Standard',
                        'Ovo-vegetarian',
                        'Vegetarian',
                        'Vegan'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? d) {
                        setState(() {
                          diet = d ?? '';
                        });
                      },
                      value: diet,
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await saveData(
                              n: name,
                              a: age,
                              g: goal,
                              h: height,
                              w: weight,
                              d: diet,
                            );
                          },
                          child: const Text('Save'),
                        ),
                        SizedBox(width: 8.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
