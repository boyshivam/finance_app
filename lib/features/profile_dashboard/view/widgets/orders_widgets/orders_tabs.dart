import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/profile_data/orders/order_tabs_data.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/orders_widgets/order_tab_pill.dart";
import "package:aprreciate/features/profile_dashboard/view_model/view_model_orders/providers/orders_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class OrdersTabs extends ConsumerWidget {
  const OrdersTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 60,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: AppColorsCommon.appWhite,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, _) => SizedBox(width: 30),
          itemCount: orderTabsData.length,
          itemBuilder: (context, index) {
            final item = orderTabsData[index].tab;

            return InkWell(
              onTap: () {
                ref.read(ordersProvider.notifier).onSelectTab(item);
              },
              child: OrderTabPill(item: orderTabsData[index]),
            );
          },
        ),
      ),
    );
  }
}
