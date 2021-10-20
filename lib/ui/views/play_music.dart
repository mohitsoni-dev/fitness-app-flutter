
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

//import 'package:assets_audio_player/assets_audio_player.dart';

class PlayMusic extends StatefulWidget {
  const PlayMusic({Key? key}) : super(key: key);

  @override
  _PlayMusicState createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  // AssetsAudioPlayer player= AssetsAudioPlayer();
  AudioPlayer audioPlayer = AudioPlayer();

  PlayerState playerState = PlayerState.PAUSED;

  // AudioPlayerState audioPlayerState=AudioPlayerState.PAUSED;
  late AudioCache audioCache;
  String path = "rain.mp3";
  //
  // int timeProgress = 0;
  // int audioDuration = 0;
  //
  // Widget slider() {
  //   return Container(
  //     width: 300,
  //     child: Slider.adaptive(
  //         value: (timeProgress / 1000).floorToDouble(),
  //         max: (audioDuration / 1000).floorToDouble(),
  //         onChanged: (value) {
  //           seekTosec(value.toInt());
  //         }),
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // player.open(Audio('assets/rain.mp3'));
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        playerState = s;
      });
    });

    // audioPlayer.onAudioPositionChanged.listen((Duration p)  async{
    //   setState(() {
    //     timeProgress = p.inMilliseconds;
    //   });
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

  playMusic() async {
    await audioCache.play(path);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  // Widget getLocalFileDuration() {
  //   return FutureBuilder<int>(
  //     future: _getAudioDuration(),
  //     builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.none:
  //           return Text('No Connection...');
  //         case ConnectionState.active:
  //         case ConnectionState.waiting:
  //           return Text('Waiting...');
  //         case ConnectionState.done:
  //           if (snapshot.hasError) return Text('Error: ${snapshot.error}');
  //           return Text(getTimeString(snapshot.data));
  //       }
  //        // unreachable
  //     },
  //   );
  // }
  //
  //
  //   Future<int> _getAudioDuration() async {
  //   var audioFile = (await audioCache.load(path))   ;
  //   await audioPlayer.setUrl(
  //    audioFile.path ,
  //   );
  //
  //   audioDuration = await Future.delayed(
  //     Duration(seconds: 2),
  //         () => audioPlayer.getDuration(),
  //   );
  //
  //   return audioDuration;
  //
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                iconSize: 50,
                onPressed: () {
                  playerState == PlayerState.PLAYING
                      ? pauseMusic()
                      : playMusic();
                },
                icon: Icon(playerState == PlayerState.PLAYING
                    ? Icons.pause
                    : Icons.play_circle)),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(getTimeString(timeProgress)),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     slider(),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     // Text(getTimeString(audioDuration)),
            //     audioDuration==0? getLocalFileDuration():Text(getTimeString(audioDuration))
            //
            //   ],
            //)
          ],
        ),
      ),
    );
  }



  // String getTimeString(int? milliseconds) {
  //   if (milliseconds == null) milliseconds = 0;
  //   String minutes =
  //       '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000).floor()}';
  //   String seconds =
  //       '${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(milliseconds / 1000).floor() % 60}';
  //   return '$minutes:$seconds'; // Returns a string with the format mm:ss
  // }
  //
  // void seekTosec(int sec) {
  //   Duration newPosition = Duration(seconds: sec);
  //   audioPlayer.seek(newPosition);
  // }
}
