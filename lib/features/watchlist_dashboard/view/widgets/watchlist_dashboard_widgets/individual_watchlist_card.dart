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
      decoration: BoxDecoration(
        color: AppColorsCommon.appWhite,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(watchlistCard.stockIcon, width: 20, height: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      watchlistCard.stockSymbol,
                      style: Theme.of(context).textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      watchlistCard.stockName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20,),
              Image.asset(
                watchlistCard.isFavourite == true
                    ? AppAssetsCommon.likedHeart
                    : AppAssetsCommon.emptyHeart,
                width: 20,
                height: 20,
              ),
            ],
          ),
          const Divider(thickness: 1, color: Colors.grey),
          Row(
            children: [
              Text(
                "\$${watchlistCard.value.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Spacer(),
              Text(
                "(${watchlistCard.valueChangePerc}%)",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 3),
              Image.asset(
                watchlistCard.valueChangeIcon == true
                    ? AppAssets.value_growth_icon
                    : AppAssets.value_fall_icon,
                width: 20,
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
