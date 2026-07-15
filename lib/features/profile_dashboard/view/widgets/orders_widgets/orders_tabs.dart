import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/profile_data/order/order_tabs_data.dart";
import "package:aprreciate/models/profile_models/orders/order_tab_pill.dart";
import "package:flutter/material.dart";

class OrdersTabs extends StatelessWidget {
  const OrdersTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: AppColorsCommon.appWhite,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              OrderTabPill(item: orderTabsData[index]),
          separatorBuilder: (_, _) => SizedBox(width: 30),
          itemCount: orderTabsData.length,
        ),
      ),
    );
  }
}
