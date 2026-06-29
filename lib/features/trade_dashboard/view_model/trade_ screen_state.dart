import 'package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/textfield_input_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/trade_fields_ui_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart';

class TradeScreenState {
  const TradeScreenState({
    required this.usWalletFundsState,
    required this.tradeFieldsUiState,
    required this.currencyToggleState,
    required this.quantityByAmount,
    required this.amountByQuantity,
    required this.convertedValue,
    required this.textFieldInputStates,
    required this.amountText,
    required this.quantityText
  });

  final UsWalletFundsState usWalletFundsState;
  final TradeFieldsUiStates tradeFieldsUiState;
  final CurrencyToggleState currencyToggleState;
  final TextFieldInputStates textFieldInputStates;
  final double quantityByAmount;
  final double amountByQuantity;
  final double convertedValue;
  final String amountText;
  final String quantityText;

  TradeScreenState copyWith({
    UsWalletFundsState? usWalletFundsState,
    TradeFieldsUiStates? tradeFieldsUiState,
    CurrencyToggleState? currencyToggleState,
    TextFieldInputStates? textFieldInputStates,

    double? quantityByAmount,
    double? amountByQuantity,
    double? convertedValue,

    String? amountText,
    String? quantityText,
  }) {
    return TradeScreenState(
      usWalletFundsState: usWalletFundsState ?? this.usWalletFundsState,
      tradeFieldsUiState: tradeFieldsUiState ?? this.tradeFieldsUiState,
      currencyToggleState: currencyToggleState ?? this.currencyToggleState,
      quantityByAmount: quantityByAmount ?? this.quantityByAmount,
      amountByQuantity: amountByQuantity ?? this.amountByQuantity,
      convertedValue: convertedValue ?? this.convertedValue,
      textFieldInputStates: textFieldInputStates ?? this.textFieldInputStates,
      amountText: amountText ?? this.amountText,
      quantityText: quantityText ??  this.quantityText
    );
  }
}
