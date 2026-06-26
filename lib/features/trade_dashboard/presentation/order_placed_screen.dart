import "package:aprreciate/core/constants/app_assets/assets_search_dashboard/assets_search_dashboard.dart";
import "package:aprreciate/core/constants/app_assets/assets_trade/order_placed_screen/assets_order_placed_screen.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter_svg/flutter_svg.dart";
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
          25, 180, 25, 25
        ),
        child: Column(
          children: [
            Image.asset(AssetsSearchDashboard.searchIcon, width: 100,height: 120,),
              // Container(
              //   color: Colors.black,
              //     child: SvgPicture.asset(AssetsOrderPlacedScreen.orderPlacedTickIcon, height: 182, width: 178,)),
              const SizedBox(height: 20),
              Text("Order Placed", ),
              const SizedBox(height: 10),
              Text("Your order to buy 3.0 qty of APPL has been placed and will be executed at the best available price."),
              const SizedBox(height: 10,),

          ],
        ),
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
