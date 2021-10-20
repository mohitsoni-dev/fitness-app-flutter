import 'dart:async';

import 'package:fitness_app_flutter/core/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class WorkoutWidget extends StatefulWidget {
  const WorkoutWidget({Key? key, required this.onSkip, required this.workouts})
      : super(key: key);
  final Function onSkip;
  final List<Workout> workouts;
  @override
  _WorkoutWidgetState createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget> {
  late int _counter;
  late Timer _timer;
  int index = 0;
  FlutterTts flutterTts = FlutterTts();

  void nextWorkout() {
    _stop();
    if (widget.workouts[index].isTimeBased) _timer.cancel();
    setState(() {
      index++;
      if (index == widget.workouts.length) {
        widget.onSkip();
      }
      if (widget.workouts[index].isTimeBased) _startTimer();
    });
  }

  void _startTimer() {
    _counter = widget.workouts[index].duration!.toInt();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        if (_counter <= 4 && _counter > 1) _speak(_counter - 1);
        setState(() {
          _counter--;
        });
      } else
        nextWorkout();
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.workouts[index].isTimeBased) _startTimer();
  }

  Future _speak(int counter) async {
    var result = await flutterTts.speak("$counter");
    //   if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    //   if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
            'https://i.giphy.com/media/ckMk3RKUK29lziaspI/giphy.webp'),
        SizedBox(height: 32),
        Text(
          widget.workouts[index].name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 48),
        Text(
          widget.workouts[index].isTimeBased
              ? '$_counter'
              : '${widget.workouts[index].reps}x',
          style: TextStyle(fontSize: 48),
        ),
        ElevatedButton.icon(
          icon: LineIcon(LineIcons.play),
          onPressed: () => nextWorkout(),
          label: Text('Next'),
        ),
      ],
    );
  }
}
