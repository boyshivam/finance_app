import "dart:async";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class OtpTimer extends StatefulWidget {
  const OtpTimer({
    super.key,
    required this.initialTime,
    required this.resendText,
  });


  final int initialTime;
  final String resendText;


  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {

  late int timeLeft;

  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeLeft = widget.initialTime;
  }

  void startTimer() {
    timer!.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (timeLeft == 0) {
        t.cancel();
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  void resetTimer() {
    timeLeft = widget.initialTime;
    startTimer();
  }

  String formatTimer() {
    int minutes = timeLeft ~/ 60;
    int seconds = timeLeft % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(
        2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Text(formatTimer());
    // return Row(
    //   children: [
    //     Text(widget.resendText, style: Theme
    //         .of(context)
    //         .textTheme
    //         .bodyMedium
    //         !.copyWith(
    //         color: AppColorsCommon.appreciateThemeColor
    //     )
    //     ),
    //     const SizedBox(width: 5),
    //     Text(formatTimer(), style: Theme
    //         .of(context)
    //         .textTheme
    //         .bodyMedium
    //         !.copyWith(
    //         color: AppColorsCommon.appreciateThemeError
    //     ),),
    //   ],
    // );
  }
}

