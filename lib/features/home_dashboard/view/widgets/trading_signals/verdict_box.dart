import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_features/app_colors_home_dashboard.dart";
import "package:flutter/material.dart";



class VerdictBox extends StatelessWidget {
  const VerdictBox({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3, horizontal: 4
      ),
      decoration: BoxDecoration(
          color: AppColorsHomeDashboard.tradingSignalVerdictBox,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: AppColorsCommon.positiveGreen,
        fontWeight: FontWeight.bold
      ),),
    );
  }
}
