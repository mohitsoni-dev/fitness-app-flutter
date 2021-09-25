import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class WorkoutWidget extends StatefulWidget {
  const WorkoutWidget({Key? key}) : super(key: key);

  @override
  _WorkoutWidgetState createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
            'https://i.giphy.com/media/ckMk3RKUK29lziaspI/giphy.webp'),
        SizedBox(height: 32),
        Text(
          'JUMPING JACKS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Countdown(
          seconds: 20,
          build: (BuildContext context, double time) => Text(time.toString()),
          interval: Duration(milliseconds: 100),
          onFinished: () {
            print('Timer is done!');
          },
        )
      ],
    );
  }
}
