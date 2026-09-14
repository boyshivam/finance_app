import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class CustomNavigationButtonHelper extends StatelessWidget {
  const CustomNavigationButtonHelper({
    super.key,
    required this.buttonText,
    required this.secondaryButton,
  });

  final String buttonText;
  final bool secondaryButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: secondaryButton
            ? AppColorsCommon.appWhite
            : AppColorsCommon.appreciateThemeColor,
        border: Border.all(
          color: AppColorsCommon.appreciateThemeColor,
          width: 2,
        ),
      ),
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: secondaryButton
              ? AppColorsCommon.appreciateThemeColor
              : AppColorsCommon.appWhite,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
