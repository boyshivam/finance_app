import 'package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart';
import 'package:aprreciate/features/profile_dashboard/enums/trade_order_type_enums.dart';

class TradeOrderDetailsModel {
  const TradeOrderDetailsModel({
    required this.security,
    required this.orderStatus,
    required this.orderID,
    required this.quantity,
    required this.estimatedPrice,
    required this.estimatedCredit,
    required this.fees,
    required this.tradeOrderType,
  });

  final String security;
  final OrderStageEnums orderStatus;
  final String orderID;
  final String quantity;
  final String estimatedPrice;
  final String estimatedCredit;
  final String fees;
  final TradeOrderTypeEnums tradeOrderType;
}
