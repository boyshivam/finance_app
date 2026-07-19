import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter/material.dart";

class IndividualWatchlistCard extends StatelessWidget {
  const IndividualWatchlistCard({super.key, required this.watchlistCard});

  final StockCardModel watchlistCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset(watchlistCard.stockIcon),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      Text(watchlistCard.stockSymbol),
                      const SizedBox(height: 5),
                      Text(watchlistCard.stockName),
                    ],
                  ),
                  const SizedBox(width: 5),
                ],
              ),
              const Spacer(),
              Image.asset(
                watchlistCard.isFavourite == true
                    ? AppAssetsCommon.likedHeart
                    : AppAssetsCommon.emptyHeart,
              ),
            ],
          ),
          const Divider(thickness: 2, color: AppColorsCommon.textGrey),
          Row(
            children: [
              Text("\$${watchlistCard.value.toStringAsFixed(2)}"),
              const Spacer(),
              Row(
                children: [
                  Text(watchlistCard.value.toString()),
                  const SizedBox(width: 3),
                  Text("(${watchlistCard.valueChangePerc}%)"),
                  const SizedBox(width: 3),
                  Image.asset(
                    watchlistCard.valueChangeIcon == true
                        ? AppAssets.value_growth_icon
                        : AppAssets.value_fall_icon,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
