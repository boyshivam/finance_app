import "package:aprreciate/models/profile_models/orders/order_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeOrdersNotifier extends Notifier<List<OrderCardModel>> {

  @override
  List<OrderCardModel> build() => [];

  void add(OrderCardModel newOrder) {
    state = [...state, newOrder];
  }
}
