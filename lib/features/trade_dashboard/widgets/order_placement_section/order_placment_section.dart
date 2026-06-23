import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/widgets/order_placement_section/order_slider.dart";
import "package:flutter/material.dart";

class OrderPlacementSection extends StatelessWidget {
  const OrderPlacementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
       25,20,25,40
      ),
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
                  Text("₹50,000"),
                  const SizedBox(width: 5,),
                  Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              )
            ],
          ),
          const SizedBox(height: 15,),
          OrderSlider()
        ],
      ),
    );
  }
}
