import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class CustomNavigationButtonHelper extends StatelessWidget {
  const CustomNavigationButtonHelper({
    super.key,
    required this.buttonText,
    required this.secondaryButton,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 22
  });

  final String buttonText;
  final bool secondaryButton;
  final FontWeight fontWeight;
  final double fontSize;

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
          fontWeight: fontWeight,
          fontSize: fontSize
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
