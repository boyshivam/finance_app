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

  bool otpTimeout = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeLeft = widget.initialTime;
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (timeLeft == 0) {
        otpTimeout = true;
        setState(() {
        });
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
    timer?.cancel();
    super.dispose();
  }

  void resetTimer() {
    setState(() {
      otpTimeout = false;
      timeLeft = widget.initialTime;
    });
    startTimer();
  }

  String formatTimer() {
    int minutes = timeLeft ~/ 60;
    int seconds = timeLeft % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        otpTimeout ? Row(
          children: [
            Text(
              "Didn't receive OTP?",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: resetTimer,
              child: Text(
                "Resend OTP",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColorsCommon.appreciateThemeColor,
                ),
              ),
            ),
          ],
        ) : Row(
          children: [
           Text(
                "Resend OTP in",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black54,
                ),
              ),
            const SizedBox(width: 5),
            Text(
              formatTimer(),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColorsCommon.appreciateThemeColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
