import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class CompanyTrademark extends StatelessWidget {
  const CompanyTrademark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 25, 10),
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
          fontSize: 26,
          fontWeight: FontWeight.w900,
          color: AppColorsCommon.appreciateThemeColor,
        ),
      ),
    );
  }
}
