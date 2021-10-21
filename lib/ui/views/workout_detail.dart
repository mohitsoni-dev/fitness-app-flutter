import 'dart:math';

import 'package:fitness_app_flutter/ui/views/exercise_view.dart';
import 'package:fitness_app_flutter/ui/widget/workout_list_item.dart';
import 'package:flutter/material.dart';

class WorkoutDetail extends StatefulWidget {
  const WorkoutDetail({Key? key, required this.workoutList}) : super(key: key);
  final List<Map<String, dynamic>> workoutList;
  @override
  _WorkoutDetailState createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final ColorTween background = ColorTween(
    begin: Colors.transparent,
    end: Colors.blue,
  );
  final ColorTween text = ColorTween(
    begin: Colors.white,
    end: Colors.black,
  );
  late List<Map<String, dynamic>> _workoutsList;

  @override
  void initState() {
    _workoutsList = [...widget.workoutList];
    super.initState();
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      // final items = _workoutsList.removeAt(oldindex);
      // _workoutsList.insert(newindex, items);
      final items = _workoutsList.removeAt(oldindex);
      _workoutsList.insert(newindex, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.80,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1579047172169-515291e29467?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chest workout',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: Text(
                                        '12 WORKOUTS',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: Text(
                                        '30 MINUTES',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            FloatingActionButton.extended(
                              label: Text("START"),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExerciseView(),
                                ),
                              ),
                              backgroundColor: Colors.black,
                            )
                          ],
                        ),
                        Divider(),
                        ReorderableListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            for (Map<String, dynamic> workout in _workoutsList)
                              WorkoutListItem(
                                workout: workout['name'],
                                key: ValueKey(new Random().nextInt(1000)),
                              )
                          ],
                          onReorder: reorderData,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(16),
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, size: 32),
            )
          ],
        ),
      ),
    );
  }
}
