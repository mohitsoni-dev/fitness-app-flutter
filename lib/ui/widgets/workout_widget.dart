import 'package:fitness_app_flutter/core/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class WorkoutWidget extends StatefulWidget {
  const WorkoutWidget({Key? key, required this.onSkip, required this.workout})
      : super(key: key);
  final Function onSkip;
  final Workout workout;
  @override
  _WorkoutWidgetState createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget> {
  bool isPaused = false;
  CountdownController _controller = new CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
            'https://i.giphy.com/media/ckMk3RKUK29lziaspI/giphy.webp'),
        SizedBox(height: 32),
        Text(
          widget.workout.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 48),
        new Countdown(
          controller: _controller,
          seconds: widget.workout.duration?.toInt() ?? 30,
          build: (BuildContext context, double time) => Text(
            time.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 54),
          ),
          interval: Duration(milliseconds: 100),
          onFinished: () {
            widget.onSkip();
            _controller.restart();
          },
        ),
        ElevatedButton.icon(
          icon: LineIcon(isPaused ? LineIcons.play : LineIcons.pause),
          onPressed: () {
            if (isPaused) {
              _controller.resume();
            } else {
              _controller.pause();
            }
            setState(() {
              isPaused = !isPaused;
            });
          },
          label: Text(isPaused ? 'Resume' : 'Pause'),
        ),
      ],
    );
  }
}
