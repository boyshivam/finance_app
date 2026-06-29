import 'package:aprreciate/features/trade_dashboard/view_model/trade_%20screen_state.dart';
import 'package:aprreciate/features/trade_dashboard/view_model/trade_screen_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tradeScreenProvider =
    NotifierProvider<TradeScreenNotifier, TradeScreenState>(
      TradeScreenNotifier.new,
    );
