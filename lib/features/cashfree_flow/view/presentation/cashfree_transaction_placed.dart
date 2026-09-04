import "package:aprreciate/core/constants/app_assets/assets_trade/order_placed_screen/assets_order_placed_screen.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cashfree_order_placed_widgets/transaction_details_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cashfree_order_placed_widgets/order_placed_button.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CashFreeTransactionPlaced extends ConsumerWidget {
  const CashFreeTransactionPlaced({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 150, 0, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsOrderPlacedScreen.orderPlacedTickIcon,
              width: 200,
              height: 200,
            ),
            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Text("Order Submitted!", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w700
                  ),),
                  const SizedBox(height: 20,),
                  Text("Transaction placed successfully, amount should reflect in account in 2-3 days", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 20
                  ),textAlign: TextAlign.center,),
                ],
              ),
            ),
            const SizedBox(height: 50),
            TransactionDetailsSection(),
            const Spacer(),
            Column(
              children: [
                OrderPlacedButton(
                  textColor: AppColorsCommon.appWhite,
                  backGroundColor: AppColorsCommon.appreciateThemeColor,
                  text: "Continue LRS",
                  routeString: AppRoutes.lrsTransferScreen,
                ),
                const SizedBox(height: 10),
                OrderPlacedButton(
                  textColor: AppColorsCommon.appreciateThemeColor,
                  backGroundColor: AppColorsCommon.appWhite,
                  text: "Goto home dashboard",
                  routeString: AppRoutes.homeDashboardScreen,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
