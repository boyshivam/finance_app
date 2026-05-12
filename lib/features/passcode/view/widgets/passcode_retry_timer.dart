import "dart:async";

import "package:flutter/material.dart";


class PasscodeRetryTimer extends StatefulWidget {
  const PasscodeRetryTimer({
    super.key, required this.initialTime,
    required this.onBlocked,
    required this.resetPasscode,
  });

  final int initialTime;
  final void Function(bool) onBlocked;
  final void Function() resetPasscode;




  @override
  State<PasscodeRetryTimer> createState() => _PasscodeRetryTimerState();
}

class _PasscodeRetryTimerState extends State<PasscodeRetryTimer> {

  late int secondsLeft;
  Timer? timer;

  @override
  void initState(){
    super.initState();
    secondsLeft = widget.initialTime;
    startTimer();
  }

  void startTimer(){

    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if(secondsLeft == 0){
        widget.onBlocked.call(false);
        // widget.resetAttempts.call(0);
        widget.resetPasscode();
        t.cancel();
      }else{
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  void resetTimer(){
    setState(() {
      widget.onBlocked.call(true);
      secondsLeft = widget.initialTime;
    });
    startTimer();
  }

  String formatTime(){
    final minutes = secondsLeft ~/ 60;
    final seconds = secondsLeft % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Text(formatTime(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Colors.red
    ),);
  }
}
