import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";

class TradeButtonsSection extends StatelessWidget {
  const TradeButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30, horizontal: 30
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)
        )
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: 70
            ),
            decoration: BoxDecoration(
              color: AppColorsCommon.appWhite,
              border: Border.all(
                width: 1,
                color: AppColorsCommon.appreciateThemeColor,

              ),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Text("Sell", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColorsCommon.appreciateThemeColor,
                fontWeight: FontWeight.w600
            )),
          ),
          const Spacer(),
          InkWell(
            onTap: (){
              AppNavigators.goToTradeScreen(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: 70
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColorsCommon.appreciateThemeColor
              ),
              child: Text("Buy", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColorsCommon.appWhite,
                fontWeight: FontWeight.w600
              ))
            ),
          )
        ],
      ),
    );
  }
}
