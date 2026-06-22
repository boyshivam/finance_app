import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class TradeFeesSection extends StatelessWidget {
  const TradeFeesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColorsCommon.appWhite,
            width: 2
          ),
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              AppColorsCommon.inactiveTextFieldBorderColor,
              AppColorsCommon.lightBlueBackground,
            ],
            stops: [0.5, 0.5],
          ),
        ),
        child: Column(
          children: [
            Row(children: [Text("Order value"), Text("\$10,000")]),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
