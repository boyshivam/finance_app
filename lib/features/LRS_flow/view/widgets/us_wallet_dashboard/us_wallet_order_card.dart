import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/profile_models/lrs/lrs_card_model.dart";
import "package:flutter/material.dart";

class UsWalletOrderCard extends StatelessWidget {
  const UsWalletOrderCard({super.key, required this.usWalletOrder});

  final UsWalletCardModel usWalletOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColorsCommon.appreciateThemeColor,
          width: 2
        ),
        color: AppColorsCommon.lightBlueBackground
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(usWalletOrder.orderStatus.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(

              ),),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text("order type"),
              const Spacer(),
              Text(usWalletOrder.orderAmount.toString()),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
