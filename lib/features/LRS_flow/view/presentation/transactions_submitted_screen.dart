import "package:aprreciate/core/constants/app_assets/assets_trade/order_placed_screen/assets_order_placed_screen.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";


class TransactionsSubmittedScreen extends StatelessWidget {
  const TransactionsSubmittedScreen({super.key});

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
                fontSize: 38,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your order to buy 3.0 qty of APPL has been placed and will be executed at the best available price.",
              ),
            ),
            const SizedBox(height: 10),
            // OrderDetailsContainer(),
            const SizedBox(height: 20),
            Container(
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
                  AppNavigators.goToHomeDashBoard(context);
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
          ],
        ),
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
