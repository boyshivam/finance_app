import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/profile_dashboard/enums/trade_order_type_enums.dart";
import "package:aprreciate/features/trade_dashboard/enums/fees_view_states.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_view_model/trade_screen_provider.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeFeesSection extends ConsumerWidget {
  const TradeFeesSection({
    super.key,
    required this.selectedSecurity,
    required this.tradeOrderType,
  });

  final StockCardModel selectedSecurity;
  final TradeOrderTypeEnums tradeOrderType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmTradeScreenProvider = ref.watch(tradeScreenProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(color: AppColorsCommon.appWhite, width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColorsCommon.inactiveTextFieldBorderColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),

              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Order value"),
                      const Spacer(),
                      if (vmTradeScreenProvider.amountText.isNotEmpty)
                        Text(
                          "\$${vmTradeScreenProvider.orderAmount.toStringAsFixed(2)}",
                        )
                      else
                        Text("\$ 0.0"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text("Total Fee"),
                          const SizedBox(width: 5),
                          Icon(Icons.info_outline),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          if (vmTradeScreenProvider.amountText.isNotEmpty)
                            Text(
                              "\$${vmTradeScreenProvider.totalFees.toStringAsFixed(2)}",
                            )
                          else
                            Text("\$ 0.0"),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              ref
                                  .read(tradeScreenProvider.notifier)
                                  .feesViewDropdown();
                            },
                            child: Icon(Icons.arrow_drop_down_circle_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (vmTradeScreenProvider.feesViewStates ==
                      FeesViewStates.fullView)
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Transaction fee"),
                              const Spacer(),
                              if (vmTradeScreenProvider.amountText.isNotEmpty)
                                Text(
                                  "\$${vmTradeScreenProvider.transactionFee.toStringAsFixed(2)}",
                                )
                              else
                                Text("\$ 0.0"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Platform fee"),
                              const Spacer(),
                              Text(
                                "\$${vmTradeScreenProvider.platformFee.toStringAsFixed(2)}",
                              ),
                            ],
                          ),
                          if (tradeOrderType ==
                              TradeOrderTypeEnums.sellFraction)
                            Row(
                              children: [
                                Text("IFSC fee"),
                                const Spacer(),
                                Text(
                                  "\$${vmTradeScreenProvider.platformFee.toStringAsFixed(2)}",
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColorsCommon.lightBlueBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),

              child: Row(
                children: [
                  Text("Amount payable"),
                  const Spacer(),
                  if (vmTradeScreenProvider.amountText.isNotEmpty)
                    Text(
                      "\$${vmTradeScreenProvider.netAmountToPay.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else
                    Text("\$ 0.0"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
