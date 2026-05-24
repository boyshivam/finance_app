import 'package:aprreciate/core/constants/app_assets/app_strings.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart';
import 'package:aprreciate/features/passcode/enums/passcode_enums.dart';
import 'package:aprreciate/features/passcode/view/extensions/passcode_extensions.dart';
import 'package:aprreciate/features/passcode/view/widgets/passcode_retry_timer.dart';
import 'package:aprreciate/features/passcode/view_model/passcode_view_model.dart';
import 'package:flutter/material.dart';

class PasscodeUI extends StatefulWidget {
  const PasscodeUI({super.key, required this.vm});

  final PasscodeViewModel vm;

  @override
  State<PasscodeUI> createState() => _PasscodeUIState();
}

class _PasscodeUIState extends State<PasscodeUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(
        color: AppColorsModule.passcodeContainerBGColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: widget.vm.validationState.validationColorsContainerBorder,
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
              final circleState = widget.vm.circleStates[index];

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
          if (widget.vm.validationState == PasscodeValidationState.incorrect) ...[
            const SizedBox(height: 5),
            Text(
              widget.vm.validationState.errorText,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColorsCommon.appreciateThemeError,
              ),
            ),
          ],
          if (widget.vm.validationState == PasscodeValidationState.locked) ...[
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.vm.validationState.errorText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColorsCommon.appreciateThemeError,
                  ),
                ),
                const SizedBox(width:5),
                PasscodeRetryTimer(
                  reset: (){
                    setState(() {
                      widget.vm.resetPasscode(PasscodeValidationState.empty);
                    });
                  },
                  numPadLocked: (value){
                    widget.vm.locked = value;
                  },
                  initialTime: 10,
                  vm : widget.vm
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
