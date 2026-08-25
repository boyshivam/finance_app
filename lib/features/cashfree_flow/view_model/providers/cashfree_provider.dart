import "package:aprreciate/features/cashfree_flow/view_model/notifiers/cashfree_notifier.dart";
import "package:aprreciate/features/cashfree_flow/view_model/state/cashfree_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final cashFreeProvider = NotifierProvider<CashFreeNotifier, CashFreeState>(
  CashFreeNotifier.new,
);
