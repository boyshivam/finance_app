import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_type_enum.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/purchase_section/amount_quantity%20_fields.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PurchaseSection extends ConsumerWidget {
  const PurchaseSection({
    super.key,
    required this.amountController,
    required this.quantityController,
    required this.amountNode,
    required this.quantityNode,
    required this.tradeType,
    required this.selectedSecurity,
  });

  final TextEditingController amountController;
  final TextEditingController quantityController;
  final FocusNode amountNode;
  final FocusNode quantityNode;
  final TradeTypeEnum tradeType;
  final StockCardModel selectedSecurity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(tradeScreenProvider);

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
                  vmState.currencyToggleState == CurrencyToggleState.toggledUsd
                      ? "Buy in dollars"
                      : "Buy in rupees",
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
