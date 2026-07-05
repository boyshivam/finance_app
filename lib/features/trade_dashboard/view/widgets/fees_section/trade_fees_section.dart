import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/enums/fees_view_states.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeFeesSection extends ConsumerWidget {
  const TradeFeesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(tradeScreenProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColorsCommon.appWhite, width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColorsCommon.inactiveTextFieldBorderColor,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Order value"),
                      const Spacer(),
                      Text("\$${vm.orderValueText}"),
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
                          Text("\$${vm.totalFees}"),
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
                  if (vm.feesViewStates == FeesViewStates.fullView)
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Transaction fee"),
                              const Spacer(),
                              Text("\$${vm.transactionFee}"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Platform fee"),
                              const Spacer(),
                              Text("\$${vm.platformFee}"),
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
                borderRadius: BorderRadius.circular(18),
              ),

              child: Row(
                children: [
                  Text("Amount payable"),
                  const Spacer(),
                  Text(
                    "\$${vm.amountPayable}",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
