import "package:aprreciate/features/cashfree_flow/view_model/notifiers/cashfree_screen_notifier.dart";
import "package:aprreciate/features/cashfree_flow/view_model/state/cashfree_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final cashFreeScreenProvider = NotifierProvider<CashFreeScreenNotifier, CashFreeScreenState>(
  CashFreeScreenNotifier.new,
);
