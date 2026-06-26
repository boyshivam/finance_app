import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/widgets/purchase_section/amount_quantity%20_fields.dart";
import "package:aprreciate/features/trade_dashboard/widgets/purchase_section/order_type_toggle.dart";
import "package:flutter/material.dart";

class PurchaseSection extends StatelessWidget {
  const PurchaseSection({
    super.key,
    required this.amountController,
    required this.quantityController,
    required this.toggledINR,
    required this.quantityPurchasedByAmount,
    required this.amountEnteredByQuantity,
    required this.isFieldEmpty
  });

  final TextEditingController amountController;
  final TextEditingController quantityController;
  final void Function() quantityPurchasedByAmount;
  final void Function() amountEnteredByQuantity;
  final bool toggledINR;
  final bool isFieldEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColorsCommon.appWhite,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            OrderTypeToggle(),
            Row(
              children: [
                Text(
                  "Buy in Rupees",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Icon(Icons.info_outline, size: 25),
              ],
            ),
            const SizedBox(height: 15),
            FractionAmountQuantityFields(
              toggledINR: toggledINR,
              amountController: amountController,
              quantityController: quantityController,
              quantityPurchasedByAmount: quantityPurchasedByAmount,
              amountEnteredByQuantity: amountEnteredByQuantity,
              isFieldEmpty: isFieldEmpty
            ),
          ],
        ),
      ),
    );
  }
}
