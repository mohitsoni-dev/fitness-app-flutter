

import 'package:blur/blur.dart';
import 'package:fitness_app_flutter/ui/views/play_music.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomMusicCard(BuildContext context, String imageLink, String theme) {
  return InkWell(
    child: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage("$imageLink"), fit: BoxFit.cover)),
        ),
        Positioned(
          top: 112,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,

            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "$theme",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            )
          ).frosted(blur:7.5,
            frostColor: Colors.black.withOpacity(0.0),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),),
        )
      ],
    ),
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PlayMusic()));
    },
  );
}
