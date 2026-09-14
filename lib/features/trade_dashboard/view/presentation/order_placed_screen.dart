import "package:aprreciate/core/constants/app_assets/assets_trade/order_placed_screen/assets_order_placed_screen.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/order_details_screen/order_details_container.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_view_model/trade_screen_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class OrderPlacedScreen extends ConsumerStatefulWidget {
  const OrderPlacedScreen({super.key});

  @override
  ConsumerState<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends ConsumerState<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 180, 25, 25),
        child: Column(
          children: [
            Image.asset(
              AssetsOrderPlacedScreen.orderPlacedTickIcon,
              width: 178,
              height: 182,
            ),
            const SizedBox(height: 20),
            Text(
              "Order Placed",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 40
              ),
            ),
            const SizedBox(height: 100),
            OrderDetailsContainer(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 30
                ),
                height: 50,
                decoration: BoxDecoration(
                  color: AppColorsCommon.appreciateThemeColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: InkWell(
                  onTap: (){
                    final vmTradeScreenProvider = ref.read(tradeScreenProvider.notifier);

                    // vmTradeScreenProvider.resetState();
                    context.go(AppRoutes.homeDashboardScreen);
                  },
                  child: Text(
                    "Go to Home Dashboard",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColorsCommon.appWhite),
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
