import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/view/presentation/add_funds_to_wallet.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/order_placement_section/order_slider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";

class OrderPlacementSection extends StatelessWidget {
  const OrderPlacementSection({
    super.key,
    required this.checkOrderValidity,
    required this.inSufficientFunds,
    required this.checkIfFieldsEmpty,
  });

  final void Function() checkOrderValidity;
  final bool inSufficientFunds;
  final bool Function() checkIfFieldsEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 40),
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
                  Text("\$ ${AppStringsCommon.USWalletBalance}"),
                  const SizedBox(width: 5),
                  Icon(Icons.arrow_drop_down_circle_outlined),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          if (inSufficientFunds)
            Row(
              children: [
                Text(
                  "insufficient Funds",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColorsCommon.negativeRed,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 10),
          if (inSufficientFunds)
            SizedBox(
              height: 50,
              child: InkWell(
                  onTap: (){
                    AppNavigators.gotoAddFundsToWalletScreen(context);
                  },
                  child: AddFundsToWallet()),
            )
          else
            OrderSlider(
              checkIfFieldsEmpty: checkIfFieldsEmpty,
              checkOrderValidity: checkOrderValidity,
            ),
        ],
      ),
    );
  }
}
