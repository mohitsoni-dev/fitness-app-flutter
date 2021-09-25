import 'package:circular_countdown_timer/circular_countdown_timer.dart';
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
    switch (_page) {
      case -1:
        return ReadyToGoWidget(
          controller: _controller,
          onComplete: () => nextStep(),
        );
      default:
        return WorkoutWidget();
    }
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
          children: [
            
            showWidget()
          ],
        ),
      ),
    );
  }
}
