import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/purchase_section/amount_quantity%20_fields.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PurchaseSection extends ConsumerWidget {
  const PurchaseSection({
    super.key,
    required this.amountController,
    required this.quantityController,
    required this.amountNode,
    required this.quantityNode,
  });

  final TextEditingController amountController;
  final TextEditingController quantityController;
  final FocusNode amountNode;
  final FocusNode quantityNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(tradeScreenProvider);

    final toggledUSD =
        CurrencyToggleState.toggledUsd == vmState.currencyToggleState;

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
            Row(
              children: [
                Text(
                  toggledUSD ? "Buy in Dollars" : "Buy in Rupees",
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
              amountController: amountController,
              quantityController: quantityController,
              amountNode: amountNode,
              quantityNode: quantityNode,
            ),
          ],
        ),
      ),
    );
  }
}
