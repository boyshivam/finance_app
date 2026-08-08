import 'package:aprreciate/features/stock_details_screen/enum/stock_details_toggle_state.dart';

class StockDetailsState {
  const StockDetailsState({required this.currencyToggleState});

  final StockDetailsToggleState currencyToggleState;

  StockDetailsState copyWith({StockDetailsToggleState? currencyToggleState}) {
    return StockDetailsState(
      currencyToggleState: currencyToggleState ?? this.currencyToggleState,
    );
  }
}
