


import 'package:aprreciate/features/profile_dashboard/enums/order_status_enum.dart';

class UsWalletCardModel {
  const UsWalletCardModel({
    required this.orderTypeHeader,
    required this.orderAmount,
    required this.orderStatus,
});

  final String orderTypeHeader;
  final double orderAmount;
  final OrderStatusEnum orderStatus;

}