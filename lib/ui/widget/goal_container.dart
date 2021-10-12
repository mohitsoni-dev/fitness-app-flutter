import 'package:flutter/material.dart';

class GoalContainer extends StatelessWidget {
  const GoalContainer(
      {Key? key,
      required this.header,
      required this.subHeader,
      required this.emoticon,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  final String header;
  final String subHeader;
  final String emoticon;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: !isSelected ? Colors.white.withOpacity(0.0) : Colors.black,
            border: Border.all(
                color: isSelected ? Colors.black : Colors.grey[350]!,
                width: 2)),
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  subHeader,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                )
              ],
            ),
            Text(emoticon, style: TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}
