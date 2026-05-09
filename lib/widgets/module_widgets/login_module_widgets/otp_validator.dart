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
    required this.defaultBorderColor,
    required this.errorMessage,
    required this.wrongOtp
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final int otpLength;
  final void Function(String otpVal, int index) otpNavigator;
  final Color defaultBorderColor;
  final String errorMessage;
  final bool wrongOtp;

  @override
  State<OtpValidator> createState() => _OtpValidatorState();
}

class _OtpValidatorState extends State<OtpValidator> {

  // input box BG color
  final Color inputBoxBGColor = Color(0xFFFFFFFF);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(
            widget.otpLength,
            (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: .92,
                  child: Container(
                    decoration: BoxDecoration(
                      color: inputBoxBGColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: widget.defaultBorderColor, width: 1.5),
                    ),
                    child: Focus(
                      onKeyEvent: (node, event) {
                        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {

                          if(index > 0 && widget.controllers[index].text.isEmpty){
                            widget.focusNodes[index - 1].requestFocus();
                          }
                        }
                        return KeyEventResult.ignored;
                      },
                      child: TextField(
                        focusNode: widget.focusNodes[index],
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textAlign: TextAlign.center,
                        controller: widget.controllers[index],
                        // focusNode: widget.focusNodes[index],
                        maxLength: 1,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          widget.otpNavigator(value, index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if(widget.wrongOtp)
        const SizedBox(height: 10),
        Text(widget.errorMessage, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.red
        ),
        textAlign: TextAlign.left,),
      ],
    );
  }
}
