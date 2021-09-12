import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:fitness_app_flutter/ui/widgets/goal_container.dart';
import 'package:flutter/material.dart';

class UserDiet extends StatefulWidget {
  const UserDiet({Key? key}) : super(key: key);

  @override
  _UserDietState createState() => _UserDietState();
}

class _UserDietState extends State<UserDiet> {
  Diet selectedDiet = Diet.standard;

  handleDietSelect(Diet selectedDiet) async {
    setState(() {
      this.selectedDiet = selectedDiet;
    });
    await addStringToSF(tag: USER_DIET, string: selectedDiet.toString());
  }

  @override
  void initState() {
    handleDietSelect(Diet.standard);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'What\'s your diet type?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 24.0),
            GoalContainer(
              header: 'Standard',
              subHeader: 'Nothing Special',
              emoticon: '',
              isSelected: selectedDiet == Diet.standard,
              onTap: () => handleDietSelect(Diet.standard),
            ),
            GoalContainer(
              header: 'Ovo-vegetarian',
              subHeader: 'No meat, but eggs',
              emoticon: '',
              isSelected: selectedDiet == Diet.eggs,
              onTap: () => handleDietSelect(Diet.eggs),
            ),
            GoalContainer(
              header: 'Vegetarian',
              subHeader: 'No meat',
              emoticon: '',
              isSelected: selectedDiet == Diet.veg,
              onTap: () => handleDietSelect(Diet.veg),
            ),
            GoalContainer(
              header: 'Vegan',
              subHeader: 'No animal products',
              emoticon: '',
              isSelected: selectedDiet == Diet.vegan,
              onTap: () => handleDietSelect(Diet.vegan),
            ),
          ],
        ),
      ),
    );
  }
}

enum Diet { standard, eggs, veg, vegan }
