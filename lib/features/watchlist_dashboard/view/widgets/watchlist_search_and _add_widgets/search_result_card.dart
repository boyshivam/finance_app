import 'package:aprreciate/core/constants/app_assets/app_assets_common.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/models/stocks_model/stock_card_model.dart';
import 'package:flutter/material.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key, required this.security});

  final StockCardModel security;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          color: AppColorsCommon.appWhite,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Row(
              children: [
                Image.asset(security.stockIcon, width: 30, height: 30,),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(security.stockSymbol, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                    ),),
                    const SizedBox(height: 5),
                    Text(security.stockName),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text("Security"),
                const SizedBox(width: 5),
                Image.asset(
                  security.isFavourite
                      ? AppAssetsCommon.likedHeart
                      : AppAssetsCommon.emptyHeart,
                  width: 20, height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
