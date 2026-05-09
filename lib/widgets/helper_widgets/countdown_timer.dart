import "dart:async";
import "package:flutter/material.dart";

class CountdownTimer extends StatefulWidget {
  const CountdownTimer(
  {
    super.key,
    required this.initialSeconds,
    required this.resetTimerText,
    this.onBlockedChanged,
  });

  final int initialSeconds;
  final String resetTimerText;
  final ValueChanged<bool>? onBlockedChanged;

  @override
  State<CountdownTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<CountdownTimer> {
  late int secondsLeft;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    secondsLeft = widget.initialSeconds;
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    widget.onBlockedChanged?.call(true);

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (secondsLeft == 0) {
        widget.onBlockedChanged?.call(false);
        t.cancel();
      } else {
        setState(() {
          secondsLeft--;
        });
      }
    });
  }

  void restartTimer() {
    setState(() {
      secondsLeft = widget.initialSeconds;
    });
    startTimer();
  }

  String formatTime() {
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
        if (!canResend)
          Text(
            formatTime(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        else
          InkWell(
            onTap: restartTimer,
            child: Text(
              widget.resetTimerText,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
      ],
    );
  }
}
