import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/orders_widgets/order_status.dart";
import "package:aprreciate/models/profile_models/orders/order_card_model.dart";
import "package:flutter/material.dart";

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.item});

  final OrderCardModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColorsCommon.appWhite,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(height: 5),
                const Spacer(),
                Text(item.orderStatus)
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  item.orderHeader,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(item.orderAmount.toStringAsFixed(2)),
              ],
            ),
            const SizedBox(height: 5),
            Row(children: [Text(item.orderQuantity.toStringAsFixed(2))]),
          ],
        ),
      ),
    );
  }
}
