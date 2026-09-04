import "package:aprreciate/models/profile_models/cashfree/cashfree_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CashFreeOrdersNotifier extends Notifier<List<CashFreeCardModel>> {

  @override
  List<CashFreeCardModel> build() {
    return [];
  }

  void addCashFreeOrder(CashFreeCardModel order){
    state = [...state, order];
  }

}