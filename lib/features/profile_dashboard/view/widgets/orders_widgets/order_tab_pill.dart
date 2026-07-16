import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/profile_dashboard/enums/order_tab_selected_enum.dart";
import "package:aprreciate/features/profile_dashboard/view_model/view_model_orders/providers/orders_provider.dart";
import "package:aprreciate/models/profile_models/orders/order_tabs_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class OrderTabPill extends ConsumerWidget {
  const OrderTabPill({super.key, required this.item});

  final OrderTabsModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(ordersProvider);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: vmState.orderTabSelected == item.tab
            ? AppColorsCommon.appreciateThemeColor
            : AppColorsCommon.appWhite,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Text(
            item.tabName,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: vmState.orderTabSelected == item.tab
                  ? AppColorsCommon.appWhite
                  : Colors.black,
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
