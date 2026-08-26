import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cashfree_order_placed_widgets/order_placed_button.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";

class CashFreeTransactionPlaced extends StatelessWidget {
  const CashFreeTransactionPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            color: AppColorsCommon.appreciateThemeColor,
            size: 200,
          ),
          const SizedBox(height: 20),
          Text("Funds added to bank successfully"),
          const SizedBox(height: 50),
          OrderPlacedButton(
            text: "Continue LRS",
            routeString: AppRoutes.lrsScreen,
          ),
          const SizedBox(height: 30),
          OrderPlacedButton(
            text: "Goto home dashboard",
            routeString: AppRoutes.homeDashboardScreen,
          ),
        ],
      ),
    );
  }
}
