import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class CompanyTrademark extends StatelessWidget {
  const CompanyTrademark({
    super.key,
    required this.paddingLeft,
    required this.paddingRight,
    required this.paddingTop,
    required this.paddingBottom,
    required this.fontSize,
    this.containerWidth,
  });

  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final double fontSize;
  final double? containerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      padding: EdgeInsets.fromLTRB(
        paddingLeft,
        paddingTop,
        paddingRight,
        paddingBottom,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            AppColorsCommon.snackBarTick,
            AppColorsCommon.lightPurpleGradient,
          ],
        ),
      ),
      child: Text(
        "TradeStox",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: AppColorsCommon.appreciateThemeColor,
        ),
      ),
    );
  }
}
