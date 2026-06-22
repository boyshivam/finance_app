import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/portfolio_dashboard_data/portfolio_dash_freq_data.dart";
import "package:flutter/material.dart";

class PortfolioDashViewerFreqTabs extends StatelessWidget {
  const PortfolioDashViewerFreqTabs({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: AppColorsCommon.appWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total P&L',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: isSelected ? Colors.black : AppColorsCommon.textGrey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
            ),
          ),
          const SizedBox(width: 5),
          Icon(Icons.circle, size: 7, color: AppColorsCommon.textGrey,),
          const SizedBox(width: 5),
          Text(
            "Day's P&L",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: isSelected ? Colors.black : AppColorsCommon.textGrey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
