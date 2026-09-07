import "package:aprreciate/models/profile_models/orders/order_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeOrdersNotifier extends Notifier<List<TradeOrderCardModel>> {

  @override
  List<TradeOrderCardModel> build() => [];

  void add(TradeOrderCardModel newOrder) {
    state = [...state, newOrder];
  }
}
