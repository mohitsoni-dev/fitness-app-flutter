import 'package:fitness_app_flutter/constants/shared_preferences.dart';
import 'package:fitness_app_flutter/ui/widgets/goal_container.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSpecification extends StatefulWidget {
  const UserSpecification({Key? key}) : super(key: key);

  @override
  _UserSpecificationState createState() => _UserSpecificationState();
}

class _UserSpecificationState extends State<UserSpecification> {
  Goal selectedGoal = Goal.none;

  handleGoalSelect(Goal selectedGoal) async {
    setState(() {
      this.selectedGoal = selectedGoal;
    });
    await addStringToSF(tag: USER_GOAL, string: selectedGoal.toString());
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
              'What\'s you goal?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 24.0),
            GoalContainer(
              header: 'Lose weight',
              subHeader: 'Burn fat & get lean',
              emoticon: '🔥',
              isSelected: selectedGoal == Goal.weightLoss,
              onTap: () => handleGoalSelect(Goal.weightLoss),
            ),
            GoalContainer(
              header: 'Get fitter',
              subHeader: 'Tone up & feel healthy',
              emoticon: '⭐',
              isSelected: selectedGoal == Goal.generalFitness,
              onTap: () => handleGoalSelect(Goal.generalFitness),
            ),
            GoalContainer(
              header: 'Gain muscle',
              subHeader: 'Build mass & strength',
              emoticon: '💪',
              isSelected: selectedGoal == Goal.gainMuscle,
              onTap: () => handleGoalSelect(Goal.gainMuscle),
            ),
          ],
        ),
      ),
    );
  }
}

enum Goal { none, weightLoss, generalFitness, gainMuscle }
