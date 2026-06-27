import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class TradeFeesSection extends StatelessWidget {
  const TradeFeesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Container(

        decoration: BoxDecoration(
          border: Border.all(color: AppColorsCommon.appWhite, width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColorsCommon.inactiveTextFieldBorderColor,
                  borderRadius: BorderRadius.circular(18)
              ),

              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Order value"),
                      const Spacer(),
                      Text("\$10,000"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text("Total Fee"),
                          const SizedBox(width: 5),
                          Icon(Icons.info_outline),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text("₹8.00"),
                          const SizedBox(width: 5),
                          Icon(Icons.arrow_drop_down_circle_outlined),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColorsCommon.lightBlueBackground,
                borderRadius: BorderRadius.circular(18)
                
              ),
              
              child: Row(
                children: [
                  Text("Amount payable"),
                  const Spacer(),
                  Text("₹50,000.00", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
