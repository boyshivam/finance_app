import "package:aprreciate/core/constants/app_assets/app_strings.dart";
import "package:aprreciate/core/themes/app_theme/app_theme.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:aprreciate/widgets/helper_widgets/custom_elevated_button.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";




class OtpValidator extends StatefulWidget {
  const OtpValidator({super.key});

  @override
  State<OtpValidator> createState() => _OtpValidatorState();
}

class _OtpValidatorState extends State<OtpValidator> {
  final int otpLength = 6;

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  final List<String> collectedOtp = [];
  var userOtp = "";

  // initiate controllers and focus nodes
  @override
  void initState() {
    super.initState();
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  // dispose controller and focusNodes
  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void formOtp() {
    for (var c in controllers) {
      userOtp = "";
      final String rawOTP = c.text.toString();
      userOtp += rawOTP;
    }
    AppNavigators.goToPasscodeScreen(context, extra: userOtp);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            otpLength,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                width: 55,
                height: 65,
                child: TextField(
                  maxLength: 1,
                  controller: controllers[index],
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  focusNode: focusNodes[index],
                  decoration: InputDecoration(
                    prefixText: " ",
                    counterText: "",
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),

                    // default border and outline color
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(16),
                    //   borderSide: BorderSide(color: Color(0xFFE1ECFC), width: 2.5),
                    // ),

                    // enabled border
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Color(0xFFE1ECFC),
                        width: 2.5,
                      ),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red, width: 2.5),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < otpLength - 1) {
                      focusNodes[index + 1].requestFocus();
                    } else if (value.isEmpty && index > 0) {
                      focusNodes[index - 1].requestFocus();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              AppStrings.log_otp_resend_txt,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: 5),
            Text(
              "Resend OTP",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 17,
                color: theColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 80),
        CustomElevatedButton(
          function: () {
            formOtp();
          },
          text: "Confirm",
        ),
      ],
    );
  }
}
