import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/order_stage_helper.dart";
import "package:aprreciate/models/profile_models/cashfree/cashfree_card_model.dart";
import "package:flutter/material.dart";

class CashFreeOrderCard extends StatelessWidget {
  const CashFreeOrderCard({super.key, required this.cashFreeOrder});

  final CashFreeCardModel cashFreeOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColorsCommon.appreciateThemeColor,
            width: 2,
          ),
          color: AppColorsCommon.appWhite,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "TXN ID: ${cashFreeOrder.transactionID}",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                OrderStageHelper(orderStage: cashFreeOrder.orderStatus),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "₹ ${cashFreeOrder.amount.toString()}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                const Spacer(),
                Text(
                  cashFreeOrder.upiID,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
