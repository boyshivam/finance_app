import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/order_placement_section/order_slider.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderPlacementSection extends ConsumerWidget {
  const OrderPlacementSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final vmState = ref.watch(tradeScreenProvider);

    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 40),
      decoration: BoxDecoration(
        color: AppColorsCommon.appWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("US Wallet"),
              const Spacer(),
              Row(
                children: [
                  Text("\$ ${AppStringsCommon.usWalletBalance}"),
                  const SizedBox(width: 5),
                  Icon(Icons.arrow_drop_down_circle_outlined),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          if (vmState.usWalletFundsState == UsWalletFundsState.insufficientFunds)
            Row(
              children: [
                Text(
                  "insufficient Funds",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColorsCommon.negativeRed,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 10),
          if (vmState.usWalletFundsState == UsWalletFundsState.insufficientFunds)
            SizedBox(
              height: 50,
              child: InkWell(
                  onTap: (){
                    AppNavigators.gotoAddFundsToWalletScreen(context);
                  },
                  child:Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColorsCommon.appreciateThemeColor,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Add funds to US wallet", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColorsCommon.appWhite
                      ),),
                    ),
                  )),
            )
          else
            OrderSlider(
            ),
        ],
      ),
    );
  }
}
