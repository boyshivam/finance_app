import "package:aprreciate/core/constants/app_assets/assets_trade/order_placed_screen/assets_order_placed_screen.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/profile_dashboard/enums/trade_order_type_enums.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/order_details_screen/order_details_container.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_view_model/trade_screen_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class OrderPlacedScreen extends ConsumerStatefulWidget {
  const OrderPlacedScreen({super.key, required this.tradeOrderType});

  final TradeOrderTypeEnums tradeOrderType;

  @override
  ConsumerState<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends ConsumerState<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 150, 25, 25),
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
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Your order will be processed in market hours",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              OrderDetailsContainer(tradeOrderType: widget.tradeOrderType),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
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
                      // trade state reset
                      final vmTradeNotifier = ref.read(tradeScreenProvider.notifier);

                      vmTradeNotifier.resetState();
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
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
