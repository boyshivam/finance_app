import 'package:aprreciate/features/profile_dashboard/enums/order_tab_selected_enum.dart';
import 'package:aprreciate/models/profile_models/orders/order_card_model.dart';

class OrdersState {
  const OrdersState({
    required this.orderTabSelected,
    required this.orderValue,
    required this.orderQuantity,
    required this.orderCards,
  });

  final OrderTabSelectedEnum orderTabSelected;
  final double orderValue;
  final double orderQuantity;
  final List<OrderCardModel> orderCards;

  OrdersState copyWith({
    OrderTabSelectedEnum? orderTabSelected,
    double? orderValue,
    double? orderQuantity,
    List<OrderCardModel>? orderCards,
  }) {
    return OrdersState(
      orderTabSelected: orderTabSelected ?? this.orderTabSelected,
      orderValue: orderValue ?? this.orderValue,
      orderQuantity: orderQuantity ?? this.orderQuantity,
      orderCards: orderCards ?? this.orderCards,
    );
  }
}
