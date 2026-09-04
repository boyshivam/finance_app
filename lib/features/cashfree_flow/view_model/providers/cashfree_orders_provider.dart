import "package:aprreciate/features/cashfree_flow/view_model/notifiers/cashfree_orders_notifier.dart";
import "package:aprreciate/models/profile_models/cashfree/cashfree_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final cashFreeOrdersProvider =
    NotifierProvider<CashFreeOrdersNotifier, List<CashFreeCardModel>>(
      CashFreeOrdersNotifier.new,
    );
