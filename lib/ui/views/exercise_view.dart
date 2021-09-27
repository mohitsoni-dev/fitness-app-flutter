import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fitness_app_flutter/core/data/workouts_data.dart';
import 'package:fitness_app_flutter/core/models/workout.dart';
import 'package:fitness_app_flutter/ui/widgets/readytogo_widget.dart';
import 'package:fitness_app_flutter/ui/widgets/workout_widget.dart';
import 'package:flutter/material.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({Key? key, required this.workouts}) : super(key: key);
  final List<String> workouts;
  @override
  _ExerciseViewState createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  CountDownController _controller = CountDownController();
  int _page = -1;

  Widget showWidget() {
    if (_page < 0)
      return ReadyToGoWidget(
        controller: _controller,
        onComplete: () => nextStep(),
      );
    else if (_page >= chest_workouts.length)
      return Center(child: Text('hi'));
    else
      return WorkoutWidget(
        onSkip: nextStep,
        workout: Workout.fromJson(chest_workouts[_page]),
      );
  }

  void nextStep() {
    setState(() {
      _page++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [showWidget()],
        ),
      ),
    );
  }
}
