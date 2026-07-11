import 'package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_notifier.dart';
import 'package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lrsProvider = NotifierProvider<LrsNotifier, LrsScreenState>(
  LrsNotifier.new,
);
