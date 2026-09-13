import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/order_stage_helper.dart";
import "package:aprreciate/models/profile_models/orders/order_card_model.dart";
import "package:flutter/material.dart";

class TradeOrderCard extends StatelessWidget {
  const TradeOrderCard({super.key, required this.item});

  final TradeOrderCardModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(0, 4),
            ),
          ],
          color: AppColorsCommon.appWhite,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: AppColorsCommon.appreciateThemeColor,
            width: 3,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
        child: Column(
          children: [
            Row(
              children: [
                Text(item.orderType.name),
                const Spacer(),
                OrderStageHelper(orderStage: item.orderStatus),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  item.security,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(item.orderAmount.toStringAsFixed(2)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Amount: ${item.orderAmount}"),
                const Spacer(),
                Text("Quantity: ${item.orderQuantity}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
