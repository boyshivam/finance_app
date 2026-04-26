
import "dart:async";
import "package:flutter/material.dart";

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key});

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {

  static const int initialSeconds = 120;

  int secondsLeft = initialSeconds;
  Timer? timer;

  @override
  void initState(){
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return ;

      if (secondsLeft == 0) {
        t.cancel();
      }else {
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  void restartTimer() {
    setState(() {
      secondsLeft = initialSeconds;
    });
    startTimer();
  }


  String formatTime(){
    final min = secondsLeft ~/ 60;
    final seconds = secondsLeft % 60;
    return "${min.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final bool canResend = secondsLeft == 0;

    return Row(
      children: [
        if(!canResend)
          Text(formatTime(), style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.primary
          ),)
        else
          InkWell(
            onTap: restartTimer,
            child: Text("Resend OTP", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.primary
            )),
          )
      ],
    );

  }
}
