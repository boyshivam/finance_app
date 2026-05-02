import 'package:aprreciate/core/constants/app_assets/app_strings.dart';
import 'package:aprreciate/core/themes/app_theme/AppColors.dart';
import 'package:aprreciate/widgets/helper_widgets/size_config.dart';
import 'package:flutter/material.dart';

class PasscodeUI extends StatelessWidget {
  const PasscodeUI({
    super.key,
    required this.currentCircleBG,
    required this.currentCircleBorder,
    required this.currentContainerBorderColor,
    required this.passcode,
  });

  final Color currentCircleBG;
  final Color currentCircleBorder;
  final Color currentContainerBorderColor;
  final String passcode;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.5,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.passcodeContainerBGColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: currentContainerBorderColor, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              AppStrings.passcode_enter_pass,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {

                
                // this will control individual circle's response to user input
                bool isFilled = index < passcode.length;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: SizeConfig.width(context) * 0.056,
                    height: SizeConfig.width(context) * 0.056,
                    decoration: BoxDecoration(
                      color: isFilled
                          ? AppColors.passcodeActiveCircleBGColor
                          : AppColors.passcodeDefaultCircleBGColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isFilled
                            ? AppColors.passcodeActiveCircleBorderColor
                            : AppColors.passcodeDefaultCircleBorderColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
