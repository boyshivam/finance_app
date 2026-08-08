import 'package:aprreciate/features/stock_details_screen/enum/stock_details_toggle_state.dart';
import 'package:aprreciate/features/stock_details_screen/view_model/stock_details_state/stock_details_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockDetailsNotifier extends Notifier<StockDetailsState> {
  @override
  StockDetailsState build() {
    return StockDetailsState(currencyToggleState: StockDetailsToggleState.usd);
  }

  void currencyToggle() {
    final isUsd = state.currencyToggleState == StockDetailsToggleState.usd;

    if (isUsd) {
      state = state.copyWith(currencyToggleState: StockDetailsToggleState.inr);
    } else {
      state = state.copyWith(currencyToggleState: StockDetailsToggleState.usd);
    }
  }
}
