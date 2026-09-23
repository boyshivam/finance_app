import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/profile_dashboard/enums/trade_order_type_enums.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_view_model/trade_screen_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class OrderDetailsContainer extends ConsumerWidget {
  const OrderDetailsContainer({super.key, required this.tradeOrderType});

  final TradeOrderTypeEnums tradeOrderType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final vmTradeScreenProvider = ref.watch(tradeScreenProvider);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 0),
          ),
        ],
        color: AppColorsCommon.appWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaction ID",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey,
                  fontWeight: FontWeight.w700
                ),
              ),
              Text(vmTradeScreenProvider.transactionId),
            ],
          ),

          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quantity",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey,
                    fontWeight: FontWeight.w700
                ),
              ),
              Text(vmTradeScreenProvider.quantityByAmount.toStringAsFixed(2)),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Estimated credit",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey,
                    fontWeight: FontWeight.w700
                ),
              ),
              Text(
                (vmTradeScreenProvider.netAmountToPay -
                        vmTradeScreenProvider.totalFees)
                    .toStringAsFixed(2),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total fees",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey,
                    fontWeight: FontWeight.w700
                ),
              ),
              Text(vmTradeScreenProvider.totalFees.toStringAsFixed(2)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order type",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey,
                    fontWeight: FontWeight.w700
                ),
              ),
              if(tradeOrderType == TradeOrderTypeEnums.buyFraction)
                Text("Buy Fraction"),
              if(tradeOrderType == TradeOrderTypeEnums.sellFraction)
                Text("Sell Fraction")


            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: AppColorsCommon.inactiveTextFieldBorderColor,
            thickness: 3,
          ),
          const SizedBox(height: 10),
          Text(
            "View in orders history",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColorsCommon.appreciateThemeColor,
            ),
          ),
        ],
      ),
    );
  }
}
