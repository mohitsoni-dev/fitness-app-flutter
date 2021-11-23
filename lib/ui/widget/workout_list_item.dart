import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class WorkoutListItem extends StatelessWidget {
  const WorkoutListItem({
    Key? key,
    required this.workout,
  }) : super(key: key);

  final Map<String, dynamic> workout;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(workout),
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            workout['name'].toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: workout['isTimeBased']
              ? Text('${workout['duration']} sec')
              : Text('${workout['reps']}x'),
        ),
        leading: Icon(LineIcons.chess, color: Colors.black),
      ),
    );
  }
}
