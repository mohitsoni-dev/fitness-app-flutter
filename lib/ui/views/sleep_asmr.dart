import 'package:fitness_app_flutter/ui/widget/sleep_asmr_widget.dart';
import 'package:flutter/material.dart';

class SleepAsmr extends StatefulWidget {
  const SleepAsmr({Key? key}) : super(key: key);

  @override
  _SleepAsmrState createState() => _SleepAsmrState();
}

class _SleepAsmrState extends State<SleepAsmr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Text(
                    "Choose your sleep mood",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomMusicCard(
                              context,
                              "http://www.fao.org/fileadmin/templates/SOFO/2020/src/images/share.jpg",
                              "Forest","forest.mp3"),
                          CustomMusicCard(
                              context,
                              "https://bsmedia.business-standard.com/_media/bs/img/article/2020-12/11/full/1607655600-5776.jpg",
                              "Hill","hill.mp3"),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomMusicCard(
                              context,
                              "https://www.skymetweather.com/content/wp-content/uploads/2020/03/rain-in-Northwest-India-social-1.jpg",
                              "Rain","rain.mp3"),
                          CustomMusicCard(
                              context,
                              "https://www.worldatlas.com/r/w1200/upload/ce/1f/bf/shutterstock-646748830.jpg",
                              "River","river.mp3"),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomMusicCard(
                              context,
                              "https://incompliancemag.com/wp-content/uploads/2019/04/Snowfall.jpg",
                              "Snow","snow.mp3"),
                          CustomMusicCard(
                              context,
                              "https://www.schaeffler.de/remotemedien/media/_shared_media_rwd/04_sectors_1/industry_1/windpower_1/47120_header-schaeffler-industry-solutions-wind-wind.jpg",
                              "Wind","wind.mp3"),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
