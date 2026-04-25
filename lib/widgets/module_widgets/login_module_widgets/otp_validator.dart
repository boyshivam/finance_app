import "package:flutter/material.dart";
import "package:flutter/services.dart";

// 6 box otp text field

class OtpValidator extends StatefulWidget {
  const OtpValidator({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.otpLength,
    required this.otpNavigator,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final int otpLength;
  final void Function(String otpVal, int index ) otpNavigator;

  @override
  State<OtpValidator> createState() => _OtpValidatorState();
}


class _OtpValidatorState extends State<OtpValidator> {
  //border
  final Color neutralBorderColor = Color(0xFFE1ECFC);
  final Color inputBoxBGColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.otpLength,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 48,
            height: 52,
            decoration: BoxDecoration(
              color: inputBoxBGColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: inputBoxBGColor, width: 2),
            ),
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.center,
              controller: widget.controllers[index],
              focusNode: widget.focusNodes[index],
              maxLength: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
              onChanged: (value){widget.otpNavigator(value, index);},
            ),
          ),
        ),
      ),
    );
  }
}
