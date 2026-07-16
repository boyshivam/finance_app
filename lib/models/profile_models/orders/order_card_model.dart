
class OrderCardModel {
  const OrderCardModel({
    required this.orderStatus,
    required this.orderHeader,
    required this.orderAmount,
    required this.orderQuantity
});

  final String orderStatus;
  final String orderHeader;
  final double orderAmount;
  final double orderQuantity;
}