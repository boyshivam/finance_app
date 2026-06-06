import 'package:aprreciate/core/constants/app_assets/app_strings.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart';
import 'package:aprreciate/features/passcode/enums/passcode_enums.dart';
import 'package:aprreciate/features/passcode/view/extensions/passcode_extensions.dart';
import 'package:aprreciate/features/passcode/view/widgets/passcode_retry_timer.dart';
import 'package:aprreciate/features/passcode/view_model/passcode_provider/passcode_provider.dart';
import 'package:aprreciate/features/passcode/view_model/passcode_view_model.dart';
import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class PasscodeUI extends ConsumerWidget {
  const PasscodeUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentState = ref.watch(passcodeProvider);

    final validationState = currentState.validationState;

    final notifier = ref.read(passcodeProvider.notifier);

    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(
        color: AppColorsModule.passcodeContainerBGColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: currentState.validationState.validationColorsContainerBorder,
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
            children: List.generate(PasscodeViewModel.reqPasscodeLength, (
              index,
            ) {
              // fills individual circles of the passcode
              final circleState = currentState.circleStates[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.056,
                  height: MediaQuery.of(context).size.width * 0.056,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: circleState.validationColorsCircleBG,
                    border: Border.all(
                      color: circleState.validationColorsCircleBorder,
                      width: 1.5,
                    ),
                  ),
                ),
              );
            }),
          ),
          if (validationState == PasscodeValidationState.incorrect) ...[
            const SizedBox(height: 5),
            Text(
              validationState.errorText,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                color: AppColorsCommon.appreciateThemeError,
              ),
            ),
          ],
          if (validationState == PasscodeValidationState.locked) ...[
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  validationState.errorText,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                    color: AppColorsCommon.appreciateThemeError,
                  ),
                ),
                const SizedBox(width: 5),
                PasscodeRetryTimer(
                  reset: () {
                    notifier.resetPasscode();
                  },
                  numPadLocked: (value) {
                    notifier.setLocked(value);
                  },
                  initialTime: 10,
                ),
                // PasscodeRetryTimer(resetPasscode: resetPasscode)
              ],
            ),
          ],
        ],
      ),
    );
  }
}
