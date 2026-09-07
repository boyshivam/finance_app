import 'package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart';
import 'package:aprreciate/features/profile_dashboard/enums/trade_order_type_enums.dart';

class TradeOrderCardModel {
  const TradeOrderCardModel({
    required this.orderStatus,
    required this.security,
    required this.orderAmount,
    required this.orderQuantity,
    required this.orderType,
  });

  final OrderStageEnums orderStatus;
  final String security;
  final double orderAmount;
  final double orderQuantity;
  final TradeOrderTypeEnums orderType;
}
