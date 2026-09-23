import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/profile_dashboard/enums/trade_order_type_enums.dart";
import "package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_fields_states.dart";
import "package:aprreciate/features/trade_dashboard/extensions/amount_field_extensions.dart";
import "package:aprreciate/features/trade_dashboard/extensions/quantity_field_extensions.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_view_model/trade_screen_provider.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class FractionAmountQuantityFields extends ConsumerWidget {
  const FractionAmountQuantityFields({
    super.key,

    required this.amountController,
    required this.quantityController,
    required this.amountNode,
    required this.quantityNode,
    required this.tradeOrderType,
    required this.security,
  });

  final TextEditingController amountController;
  final TextEditingController quantityController;
  final FocusNode amountNode;
  final FocusNode quantityNode;
  final TradeOrderTypeEnums tradeOrderType;
  final String security;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(tradeScreenProvider);

    return Column(
      children: [
        Column(
          children: [
            // Amount text field
            TextField(
              focusNode: amountNode,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
              ],
              decoration: InputDecoration(
                prefix:
                    vmState.currencyToggleState ==
                        CurrencyToggleState.toggledInr
                    ? Text(
                        "₹ ",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        "\$ ",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                hint: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Amount"),
                ),
                border: InputBorder.none,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.inactiveTextFieldBorderColor,
                    width: 2,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.appreciateThemeColor,
                    width: 2,
                  ),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.negativeRed,
                    width: 2,
                  ),
                ),
              ),

              onChanged: (value) {
                final notifier = ref.read(tradeScreenProvider.notifier);
                notifier.deriveAmount(value);
                notifier.quantityByAmount();

                if (tradeOrderType == TradeOrderTypeEnums.buyFraction) {
                  print("validate");
                  notifier.calculateBuyFees();
                  notifier.validateBuyTradeOrder();
                }
                if (tradeOrderType == TradeOrderTypeEnums.sellFraction) {
                  notifier.calculateSellFees(security);
                  notifier.validateSellTradeOrder(security);
                }
              },
            ),
            const SizedBox(height: 5),
            Text(
              vmState.amountTextFieldErrorMessageState.amountValidationTexts,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColorsCommon.negativeRed,
              ),
            ),
            const SizedBox(height: 20),

            // quantity text field
            TextField(
              focusNode: quantityNode,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              controller: quantityController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,5}$')),
              ],
              decoration: InputDecoration(
                prefix: Text("Qty  "),
                hint: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Qty"),
                ),

                border: InputBorder.none,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.inactiveTextFieldBorderColor,
                    width: 2,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.appreciateThemeColor,
                    width: 2,
                  ),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.negativeRed,
                    width: 2,
                  ),
                ),
              ),

              // ON changed function for quantity
              onChanged: (value) {
                final notifier = ref.read(tradeScreenProvider.notifier);
                notifier.deriveQuantity(value);
                notifier.amountByQuantity();

                if (tradeOrderType == TradeOrderTypeEnums.buyFraction) {
                  notifier.calculateBuyFees();
                  notifier.validateBuyTradeOrder();
                }
                if (tradeOrderType == TradeOrderTypeEnums.sellFraction) {
                  notifier.calculateSellFees(security);
                  notifier.validateSellTradeOrder(security);
                }
              },
            ),
          ],
        ),

        Text(
          vmState.quantityTextFieldState.quantityValidationTexts,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: vmState.quantityTextFieldState.quantityValidationTextColor,
          ),
        ),
      ],
    );
  }
}
