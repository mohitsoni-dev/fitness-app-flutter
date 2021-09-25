import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class ReadyToGoWidget extends StatelessWidget {
  const ReadyToGoWidget({
    required this.onComplete,
    required this.controller,
  });

  final CountDownController controller;
  final void Function()? onComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
            'https://i.giphy.com/media/ckMk3RKUK29lziaspI/giphy.webp'),
        Text(
          'READY TO GO!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        Text(
          'JUMPING JACKS',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        CircularCountDownTimer(
          duration: 15,
          initialDuration: 0,
          controller: controller,
          width: MediaQuery.of(context).size.width / 3.25,
          height: MediaQuery.of(context).size.height / 3.25,
          ringColor: Colors.grey[300]!,
          ringGradient: null,
          fillColor: Colors.black,
          fillGradient: null,
          backgroundGradient: null,
          strokeWidth: 10.0,
          strokeCap: StrokeCap.round,
          textStyle: TextStyle(
            fontSize: 56.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textFormat: CountdownTextFormat.S,
          isReverse: false,
          isReverseAnimation: false,
          isTimerTextShown: true,
          autoStart: true,
          onStart: () {
            print('Countdown Started');
          },
          onComplete: onComplete,
        ),
      ],
    );
  }
}
