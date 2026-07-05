import 'package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/fees_view_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/order_eligibility_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/text_field_error_message_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/trade_fields_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart';

class TradeScreenState {
  const TradeScreenState({
    required this.usWalletFundsState,
    required this.amountTextFieldState,
    required this.quantityTextFieldState,
    required this.amountTextFieldErrorMessageState,
    required this.quantityTextFieldErrorMessageState,
    required this.currencyToggleState,
    required this.quantityByAmount,
    required this.amountByQuantity,
    required this.convertedValue,
    required this.amountText,
    required this.quantityText,
    required this.orderValueText,
    required this.transactionFee,
    required this.platformFee,
    required this.amountPayable,
    required this.usWalletBalance,
    required this.orderEligibility,
    required this.feesViewStates,
    required this.totalFees,
    required this.stockPrice,
  });

  final UsWalletFundsState usWalletFundsState;
  final TextFieldsStates amountTextFieldState;
  final TextFieldsStates quantityTextFieldState;
  final TextFieldErrorMessageState amountTextFieldErrorMessageState;
  final TextFieldErrorMessageState quantityTextFieldErrorMessageState;
  final CurrencyToggleState currencyToggleState;
  final double quantityByAmount;
  final double amountByQuantity;
  final double convertedValue;
  final double usWalletBalance;
  final String amountText;
  final String quantityText;
  final String orderValueText;
  final String amountPayable;
  final String transactionFee;
  final String platformFee;
  final OrderEligibilityStates orderEligibility;
  final FeesViewStates feesViewStates;
  final String totalFees;
  final double stockPrice;

  TradeScreenState copyWith({
    UsWalletFundsState? usWalletFundsState,
    CurrencyToggleState? currencyToggleState,
    TextFieldsStates? amountTextFieldState,
    TextFieldsStates? quantityTextFieldState,
    TextFieldErrorMessageState? amountTextFieldErrorMessageState,
    TextFieldErrorMessageState? quantityTextFieldErrorMessageState,
    double? usWalletBalance,
    double? quantityByAmount,
    double? amountByQuantity,
    double? convertedValue,

    String? amountText,
    String? quantityText,
    String? orderValueText,
    String? amountPayable,
    String? transactionFee,
    String? platformFee,

    OrderEligibilityStates? orderEligibility,
    FeesViewStates? feesViewStates,
    String? totalFees,
    double? stockPrice,
  }) {
    return TradeScreenState(
      usWalletFundsState: usWalletFundsState ?? this.usWalletFundsState,
      amountTextFieldState: amountTextFieldState ?? this.amountTextFieldState,
      quantityTextFieldState:
          quantityTextFieldState ?? this.quantityTextFieldState,
      amountTextFieldErrorMessageState:
          amountTextFieldErrorMessageState ??
          this.amountTextFieldErrorMessageState,
      quantityTextFieldErrorMessageState:
          quantityTextFieldErrorMessageState ??
          this.amountTextFieldErrorMessageState,
      orderEligibility: orderEligibility ?? this.orderEligibility,
      currencyToggleState: currencyToggleState ?? this.currencyToggleState,
      quantityByAmount: quantityByAmount ?? this.quantityByAmount,
      amountByQuantity: amountByQuantity ?? this.amountByQuantity,
      convertedValue: convertedValue ?? this.convertedValue,
      usWalletBalance: usWalletBalance ?? this.usWalletBalance,

      // amount texts
      amountText: amountText ?? this.amountText,
      quantityText: quantityText ?? this.quantityText,
      orderValueText: orderValueText ?? this.orderValueText,
      amountPayable: amountPayable ?? this.amountPayable,
      transactionFee: transactionFee ?? this.transactionFee,
      platformFee: platformFee ?? this.platformFee,

      // fees in full view
      feesViewStates: feesViewStates ?? this.feesViewStates,
      totalFees: totalFees ?? this.totalFees,
      stockPrice: stockPrice ?? this.stockPrice,
    );
  }
}
