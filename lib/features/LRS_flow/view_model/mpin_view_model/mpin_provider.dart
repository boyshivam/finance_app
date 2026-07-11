import "package:aprreciate/features/LRS_flow/view_model/mpin_view_model/mpin_notifier.dart";
import "package:aprreciate/features/LRS_flow/view_model/mpin_view_model/mpin_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final mpinProvider = NotifierProvider<MpinNotifier, MpinState>(
  MpinNotifier.new,
);
