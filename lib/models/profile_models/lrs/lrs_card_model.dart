


import 'package:aprreciate/features/LRS_flow/enums/us_wallet_order_enum.dart';
import 'package:aprreciate/features/profile_dashboard/enums/order_status_enum.dart';

class UsWalletCardModel {
  const UsWalletCardModel({
    required this.orderType,
    required this.orderAmount,
    required this.orderStatus,
    // required this.orderTime
});

  final UsWalletOrderEnum orderType;
  final double orderAmount;
  final OrderStatusEnum orderStatus;
  // final DateTime orderTime;

}