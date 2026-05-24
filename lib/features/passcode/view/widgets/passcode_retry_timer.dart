import "dart:async";

import "package:aprreciate/features/passcode/enums/passcode_enums.dart";
import "package:aprreciate/features/passcode/view_model/passcode_view_model.dart";
import "package:flutter/material.dart";


class PasscodeRetryTimer extends StatefulWidget {
  const PasscodeRetryTimer({
    super.key,
    required this.numPadLocked,
    required this.initialTime,
    required this.vm,
    required this.reset,
  });
  final void Function(bool ) numPadLocked;
  final int initialTime;
  final PasscodeViewModel  vm;
  final void Function() reset;

  @override
  State<PasscodeRetryTimer> createState() => _PasscodeRetryTimerState();
}

class _PasscodeRetryTimerState extends State<PasscodeRetryTimer> {

  late int timeLeft;
  Timer ? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeLeft = widget.initialTime;
    startTimer();
  }

  void startTimer(){
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t){
      if(timeLeft == 0){
        widget.numPadLocked.call(false);
        widget.reset();
        t.cancel();
      }else{
        setState(() {
          timeLeft --;
        });
      }
    });
  }

  void resetTimer(){
    timeLeft = widget.initialTime;
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  String formatTime() {
    final int minutes = timeLeft ~/ 60;
    final int seconds = timeLeft % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Text(formatTime(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Colors.red
    ),);
  }
}
