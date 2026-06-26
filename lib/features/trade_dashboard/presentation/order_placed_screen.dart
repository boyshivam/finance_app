import "package:aprreciate/core/constants/app_assets/assets_trade/order_placed_screen/assets_order_placed_screen.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";


class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({super.key});

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          25, 40, 25, 25 
        ),
        child: Column(
          children: [
              Image.asset(AssetsOrderPlacedScreen.orderPlacedTickIcon, width: 179, height: 183,),
              const SizedBox(height: 20),
            
          ],
        ),
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
