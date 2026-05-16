import 'package:aprreciate/core/constants/app_assets/app_strings.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart';
import 'package:aprreciate/features/passcode/enums/passcode_enums.dart';
import 'package:aprreciate/features/passcode/view/extensions/passcode_extensions.dart';
import 'package:aprreciate/features/passcode/view/widgets/passcode_retry_timer.dart';
import 'package:aprreciate/features/passcode/view_model/passcode_view_model.dart';
import 'package:flutter/material.dart';

class PasscodeUI extends StatelessWidget {
  const PasscodeUI({
    super.key,
    required this.onBlocked,
    required this.reqPasscodeLength,
    required this.passcode,
    required this.vm,
    required this.numpadLocked,
    required this.incorrectPasscode,
    required this.resetPasscode,

  });
  final void Function(bool) onBlocked;
  final int reqPasscodeLength;
  final String passcode;
  final PasscodeViewModel vm;
  final bool numpadLocked;
  final bool incorrectPasscode;
  // final void Function(int) attemptNum;
  final void Function() resetPasscode;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(
        color: AppColorsModule.passcodeContainerBGColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: vm.hasError
              ? PasscodeContainerState.error.borderColor
              : PasscodeContainerState.active.borderColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Enter passcode text
          Text(
            AppStrings.passcode_enter_pass,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10),

          // Row of passcode circles ie passcode UI
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(reqPasscodeLength, (index) {
              // fills individual circles of the passcode
              bool isFilled = index < passcode.length;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.056,
                  height: MediaQuery.of(context).size.width * 0.056,
                  decoration: BoxDecoration(
                    color: vm.hasError
                        ? PasscodeCircleBackgroundState.error.backgroundColor
                        : isFilled
                        ? PasscodeCircleBackgroundState.active.backgroundColor
                        : PasscodeCircleBackgroundState
                              .inactive
                              .backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: vm.hasError
                          ? PasscodeCircleBorderState.error.borderColor
                          : isFilled
                          ? PasscodeCircleBorderState.active.borderColor
                          : PasscodeCircleBorderState.inactive.borderColor,
                      width: 1.5,
                    ),
                  ),
                ),
              );
            }),
          ),
          if (incorrectPasscode)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  PasscodeErrorMessageState.wrongPasscode.errorText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColorsModule.passcodeIncorrectCircleBorderColor,
                  ),
                ),
              ],
            ),
          if (numpadLocked)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  PasscodeErrorMessageState.numpadLocked.errorText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColorsModule.passcodeIncorrectCircleBorderColor,
                  ),
                ),
                const SizedBox(width: 5),
                PasscodeRetryTimer(
                  initialTime: PasscodeViewModel.timerDuration,
                  onBlocked: onBlocked,
                  resetPasscode: resetPasscode,

                ),
              ],
            ),
        ],
      ),
    );
  }
}
