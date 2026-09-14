import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/order_stage_helper.dart";
import "package:aprreciate/features/LRS_flow/enums/us_wallet_order_enum.dart";
import "package:aprreciate/features/LRS_flow/extensions/us_wallet_order_type_extension.dart";
import "package:aprreciate/models/profile_models/lrs/lrs_card_model.dart";
import "package:flutter/material.dart";

class UsWalletOrderCard extends StatelessWidget {
  const UsWalletOrderCard({super.key, required this.usWalletOrder});

  final UsWalletCardModel usWalletOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              offset: Offset(0, 4),
              spreadRadius: 3
            )
          ],
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
                Text(usWalletOrder.orderType.getOrderTypeText, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400
                ),) ,
                const Spacer(),
                OrderStageHelper(orderStage: usWalletOrder.orderStatus)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("\$ ${usWalletOrder.orderAmount}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600
                ),),
                const Spacer(),
                Text(usWalletOrder.orderTxnId,),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
