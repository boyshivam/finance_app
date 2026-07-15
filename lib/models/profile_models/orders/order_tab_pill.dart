import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/profile_models/orders/order_tabs_model.dart";
import "package:flutter/material.dart";

class OrderTabPill extends StatelessWidget {
  const OrderTabPill({super.key, required this.item});

  final OrderTabsModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColorsCommon.appreciateThemeColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Text(
            item.tabName,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColorsCommon.appWhite,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 5),
          Icon(item.tabIcon, size: 18, color: AppColorsCommon.appWhite),
        ],
      ),
    );
  }
}
