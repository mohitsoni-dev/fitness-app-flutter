import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

//import 'package:assets_audio_player/assets_audio_player.dart';

class PlayMusic extends StatefulWidget {
  final String audioPath;
  final String theme;
  final String imageLink;

  const PlayMusic(
      {Key? key,
      required this.audioPath,
      required this.theme,
      required this.imageLink})
      : super(key: key);

  @override
  _PlayMusicState createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  AudioPlayer audioPlayer = AudioPlayer();

  PlayerState playerState = PlayerState.PAUSED;

  late AudioCache audioCache;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // player.open(Audio('assets/rain.mp3'));
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      if (this.mounted) {
        setState(() {
          playerState = s;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

//Todo add timer
  playMusic() async {
    await audioCache.play(widget.audioPath);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(0, 147, 233, 0),
              Color.fromRGBO(128, 208, 199, 100)
            ],
          )),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Essence of nature - ${widget.theme}",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(widget.imageLink),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
