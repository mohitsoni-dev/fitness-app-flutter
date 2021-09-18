import 'package:flutter/material.dart';

Widget feedSection(BuildContext context) {
  return InkWell(
    child: Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            height: 120,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, bottom: 10, top: 10),
                  child: Text(
                    "Science Just Confirmed Elon Musk's Favorite Interview ",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Author"),
                    Text("3 min read"),
                    Icon(Icons.star)
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width / 3,
            //color: Colors.blue,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://static01.nyt.com/images/2021/01/30/business/29musk-print/29musk-1-mediumSquareAt3X.jpg"),
                    fit: BoxFit.contain)),
          ),
        ],
      ),
    ),
    onTap: () {},
  );
}
