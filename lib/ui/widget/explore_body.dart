import 'package:fitness_app_flutter/core/models/article.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget feedSection({required BuildContext context, Article? article}) {
  String? url = article?.source;
  String? imageLink = article?.image;
  return InkWell(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        //direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              // height: 120,
              color: Colors.transparent,
              child: Column(
                /*column*/
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, bottom: 10, top: 10),
                    child: Text(
                      article?.title ?? '',
                      //maxLines: 3,
                      //overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(article?.author ?? ''),
                     // Text("3 min read"),
                      Icon(Icons.star)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width / 3,
            //color: Colors.blue,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        //"https://static01.nyt.com/images/2021/01/30/business/29musk-print/29musk-1-mediumSquareAt3X.jpg"
                      "$imageLink" ),
                    fit: BoxFit.contain)),
          ),
        ],
      ),
    ),
    onTap: () {
      launchURL(url!);
    },
  );
}

launchURL(String url) async {
  if (url.length == 0) {
    debugPrint("No url added");
  } else {
    await launch(url, forceWebView: true);
  }
}
