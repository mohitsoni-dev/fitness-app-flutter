import 'package:fitness_app_flutter/ui/views/workout_detail.dart';
import 'package:flutter/material.dart';

class WorkoutProgramCard extends StatelessWidget {
  const WorkoutProgramCard({Key? key, required this.desc, required this.title})
      : super(key: key);
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 280.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
              'https://images.unsplash.com/photo-1579047172169-515291e29467?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80'),
          SizedBox(height: 8.0),
          Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 8.0),
          Text(desc, style: TextStyle(fontSize: 12)),
          SizedBox(height: 4.0),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  'INFO',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
              SizedBox(width: 8.0),
              OutlinedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WorkoutDetail())),
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
