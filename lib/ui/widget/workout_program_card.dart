import 'package:fitness_app_flutter/ui/views/workout_detail.dart';
import 'package:flutter/material.dart';

class WorkoutProgramCard extends StatelessWidget {
  const WorkoutProgramCard({
    Key? key,
    required this.desc,
    required this.title,
    required this.workoutList,
    required this.image,
  }) : super(key: key);
  final String title;
  final String desc;
  final String image;
  final List<Map<String, dynamic>> workoutList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 280.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(child: Image.network(image), tag: 'workout_image'),
          SizedBox(height: 8.0),
          Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 8.0),
          Text(desc, style: TextStyle(fontSize: 12)),
          SizedBox(height: 4.0),
          Row(
            children: [
              // OutlinedButton(
              //   onPressed: () {},
              //   child: Text(
              //     'INFO',
              //     style: TextStyle(color: Colors.black, fontSize: 12),
              //   ),
              // ),
              SizedBox(width: 8.0),
              OutlinedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetail(
                      workoutList: workoutList,
                      title: title,
                      image: image,
                    ),
                  ),
                ),
                child: Text(
                  'START',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
