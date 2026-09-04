

import "package:aprreciate/features/cashfree_flow/enums/cash_free_order_status.dart";


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
  final CashFreeOrderStatusEnums orderStatus;


}