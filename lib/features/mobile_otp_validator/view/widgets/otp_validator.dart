import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart";
import "package:aprreciate/features/mobile_otp_validator/enums/mobile_otp_enum.dart";
import "package:aprreciate/features/mobile_otp_validator/view/extensions/mobile_otp_extensions.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

// 6 box otp text field

class OtpValidator extends StatelessWidget {
  const OtpValidator({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.otpLength,
    required this.otpNavigator,
    required this.validationState,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final int otpLength;
  final void Function(String otpVal, int index) otpNavigator;
  final MobileOtpValidationState validationState;

  // input box BG color8
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(
            otpLength,
            (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: .92,
                  child: ValueListenableBuilder(
                    valueListenable: controllers[index],
                    builder: (context, value, child) {
                      bool isFilled = controllers[index].text.isNotEmpty;

                      return Container(
                        decoration: BoxDecoration(
                          color: AppColorsModule.otpBoxBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isFilled
                                ? validationState.validationColor
                                : AppColorsModule.otpBoxDefaultStateColor,
                            width: 2,
                          ),
                        ),
                        child: Focus(
                          onKeyEvent: (node, event) {
                            if (event is KeyDownEvent &&
                                event.logicalKey ==
                                    LogicalKeyboardKey.backspace) {
                              if (index > 0 &&
                                  controllers[index].text.isEmpty) {
                                focusNodes[index - 1].requestFocus();
                              }
                            }
                            return KeyEventResult.ignored;
                          },
                          child: TextField(
                            focusNode: focusNodes[index],
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            controller: controllers[index],
                            // focusNode: widget.focusNodes[index],
                            maxLength: 1,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              otpNavigator(value, index);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        if (validationState.hasError) const SizedBox(height: 10),
        Text(
          validationState.errorText,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.red),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
