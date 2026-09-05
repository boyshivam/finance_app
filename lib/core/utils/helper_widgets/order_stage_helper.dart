import "package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart";
import "package:aprreciate/core/utils/common_helper_extension/order_stage_extensions.dart";
import "package:flutter/material.dart";

class OrderStageHelper extends StatelessWidget {
  const OrderStageHelper({super.key, required this.orderStage});

  final OrderStageEnums orderStage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: orderStage.errorTextColor,
          width: 2
        ),
        borderRadius: BorderRadius.circular(18),
        color: orderStage.errorBgColor,
      ),
      child: Text(
        orderStage.errorText,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w900,
          fontSize: 12,
          color: orderStage.errorTextColor,
        ),
      ),
    );
  }
}
