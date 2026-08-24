import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/stock_details_screen/view/widgets/stock_graph.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter/material.dart";

class SecurityInfo extends StatelessWidget {
  const SecurityInfo({super.key, required this.selectedSecurity});

  final StockCardModel selectedSecurity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColorsCommon.appWhite,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(selectedSecurity.stockIcon, width: 30, height: 30),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedSecurity.stockSymbol,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      selectedSecurity.stockName,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.timer, size: 30),
                    const SizedBox(width: 5),
                    Image.asset(
                      AppAssetsCommon.emptyHeart,
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 5),
                    Icon(Icons.arrow_drop_down_circle_outlined, size: 30),
                  ],
                ),
              ],
            ),
            const Divider(color: AppColorsCommon.inactiveTextFieldBorderColor),
            StockGraph(selectedSecurity: selectedSecurity),
          ],
        ),
      ),
    );
  }
}
