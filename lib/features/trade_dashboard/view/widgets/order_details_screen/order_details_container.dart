import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";



class OrderDetailsContainer extends ConsumerWidget {
  const OrderDetailsContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final tradeOrderDetails = ref.watch(tradeScreenProvider);

    return Container(
      padding:EdgeInsets.symmetric(
        vertical: 20, horizontal: 25,
      ),
      decoration: BoxDecoration(
        color: AppColorsCommon.appWhite,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("orders ID", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColorsCommon.textGrey
              ),),
              Text("AB1ZW19D")
            ],
          ),

          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Quantity", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey
              ),),
              Text(tradeOrderDetails.quantityText)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Estimated price", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey
              ),),
              Text(tradeOrderDetails.amountPayable)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Estimated credit", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey
              ),),
              Text(tradeOrderDetails.orderValueText)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fees", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey
              ),),
              Text(tradeOrderDetails.totalFees)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order type", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.textGrey
              ),),
              Text("Market")
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: AppColorsCommon.inactiveTextFieldBorderColor, thickness: 3,),
          const SizedBox(height: 10,),
          Text("view in orders history", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColorsCommon.appreciateThemeColor
          )),
        ],
      ),
    );
  }
}
