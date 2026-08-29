import "package:aprreciate/core/constants/app_assets/assets_trade/order_placed_screen/assets_order_placed_screen.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TransactionsSubmittedScreen extends ConsumerWidget {
  const TransactionsSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmLrs = ref.watch(lrsProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 180, 25, 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              AssetsOrderPlacedScreen.orderPlacedTickIcon,
              width: 178,
              height: 182,
            ),
            const SizedBox(height: 40),
            Text(
              "Transaction submitted successfully!",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              "You will receive a notification once your transaction status is updated.",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Order amount \$${vmLrs.enteredAmount} in progress ", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
              ),
            ),
            const SizedBox(height: 10),
            // OrderDetailsContainer(),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                height: 50,
                decoration: BoxDecoration(
                  color: AppColorsCommon.appreciateThemeColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: InkWell(
                  onTap: () {
                    context.go(AppRoutes.homeDashboardScreen);
                  },
                  child: Text(
                    "Go to Home Dashboard",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColorsCommon.appWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
