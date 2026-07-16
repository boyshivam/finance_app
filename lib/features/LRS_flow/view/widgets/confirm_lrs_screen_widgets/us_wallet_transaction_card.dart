import "package:aprreciate/models/profile_models/lrs/lrs_card_model.dart";
import "package:flutter/material.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";


class UsWalletTransactionCard extends StatelessWidget {
  const UsWalletTransactionCard({super.key, required this.item});

  final UsWalletCardModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColorsCommon.appWhite,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
        child: Column(
          children: [
           Row(
             children: [
               Text(item.orderTypeHeader),
               const Spacer(),
               Text(item.orderAmount.toStringAsFixed(2))
             ],
           ),
            Row(
              children: [
                Text(item.orderStatus.name)
              ],
            )
          ],
        ),
      ),
    );
  }
}
