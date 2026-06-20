import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/search_dashboard_models/search_dashboard_card_model.dart";
import "package:flutter/material.dart";

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item, required this.liked});

  final SearchDashboardCardModel item;
  final bool liked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColorsCommon.appWhite,
      ),
      child: Row(
        children: [
          Image.asset(item.icon, width: 30, height: 30),
          const SizedBox(width: 50),
          Column(
            children: [
              Text(
                item.itemSymbol,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                item.itemName,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(item.itemType),
              const SizedBox(width: 10),
              Image.asset(
                liked ? AppAssetsCommon.likedHeart : AppAssetsCommon.emptyHeart,
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
