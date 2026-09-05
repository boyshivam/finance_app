

import "package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart";


class CashFreeCardModel {
  const CashFreeCardModel ({
    required this.amount,
    required this.transactionID,
    required this.upiID,
    required this.orderStatus
});

  final String amount;
  final String transactionID;
  final String upiID;
  final OrderStageEnums orderStatus;


}