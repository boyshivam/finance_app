import 'package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/fees_view_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/order_eligibility_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/sell_security_holding_enum.dart';
import 'package:aprreciate/features/trade_dashboard/enums/sell_trade_negative_order_enum.dart';
import 'package:aprreciate/features/trade_dashboard/enums/textfield_validation_enums.dart';
import 'package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart';

class TradeScreenState {
  const TradeScreenState({
    required this.securityName,
    required this.securitySymbol,
    required this.securityIcon,
    required this.usWalletFundsState,
    required this.sellTradeNegativeOrderState,
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
    required this.orderAmount,
    required this.transactionFee,
    required this.platformFee,
    required this.netAmountToPay,
    required this.orderEligibility,
    required this.feesViewStates,
    required this.totalFees,
    required this.stockPrice,
    required this.transactionId,
    required this.sellIFSCAFee,
    required this.sellHoldingState,
  });

  final String securityName;
  final String securitySymbol;
  final String securityIcon;
  final UsWalletFundsState usWalletFundsState;
  final SellTradeNegativeOrderEnum sellTradeNegativeOrderState;
  final TextFieldValidationEnums amountTextFieldState;
  final TextFieldValidationEnums quantityTextFieldState;
  final TextFieldValidationEnums amountTextFieldErrorMessageState;
  final TextFieldValidationEnums quantityTextFieldErrorMessageState;
  final CurrencyToggleState currencyToggleState;
  final double quantityByAmount;
  final double amountByQuantity;
  final double convertedValue;
  final String amountText;
  final String quantityText;
  final double orderAmount;
  final double netAmountToPay;
  final double transactionFee;
  final double platformFee;
  final double sellIFSCAFee;
  final OrderEligibilityStates orderEligibility;
  final FeesViewStates feesViewStates;
  final double totalFees;
  final double stockPrice;
  final String transactionId;
  final SellSecurityHoldingEnum sellHoldingState;

  TradeScreenState copyWith({
    String? securityName,
    String? securitySymbol,
    String? securityIcon,
    UsWalletFundsState? usWalletFundsState,
    SellTradeNegativeOrderEnum? sellTradeNegativeOrderState,
    CurrencyToggleState? currencyToggleState,
    TextFieldValidationEnums? amountTextFieldState,
    TextFieldValidationEnums? quantityTextFieldState,
    TextFieldValidationEnums? amountTextFieldErrorMessageState,
    TextFieldValidationEnums? quantityTextFieldErrorMessageState,
    double? quantityByAmount,
    double? amountByQuantity,
    double? convertedValue,

    String? amountText,
    String? quantityText,
    double? orderAmount,
    double? netAmountToPay,
    double? transactionFee,
    double? platformFee,

    OrderEligibilityStates? orderEligibility,
    FeesViewStates? feesViewStates,
    double? totalFees,
    double? stockPrice,
    String? transactionId,
    double? sellIFSCAFee,
    SellSecurityHoldingEnum? sellHoldingState,
  }) {
    return TradeScreenState(
      securityName: securityName ?? this.securityName,
      securitySymbol: securitySymbol ?? this.securitySymbol,
      securityIcon: securityIcon ?? this.securityIcon,
      usWalletFundsState: usWalletFundsState ?? this.usWalletFundsState,
      sellTradeNegativeOrderState:
          sellTradeNegativeOrderState ?? this.sellTradeNegativeOrderState,
      amountTextFieldState: amountTextFieldState ?? this.amountTextFieldState,
      quantityTextFieldState:
          quantityTextFieldState ?? this.quantityTextFieldState,
      amountTextFieldErrorMessageState:
          amountTextFieldErrorMessageState ??
          this.amountTextFieldErrorMessageState,
      quantityTextFieldErrorMessageState:
          quantityTextFieldErrorMessageState ??
          this.quantityTextFieldErrorMessageState,
      orderEligibility: orderEligibility ?? this.orderEligibility,
      currencyToggleState: currencyToggleState ?? this.currencyToggleState,
      quantityByAmount: quantityByAmount ?? this.quantityByAmount,
      amountByQuantity: amountByQuantity ?? this.amountByQuantity,
      convertedValue: convertedValue ?? this.convertedValue,
      // amount texts
      amountText: amountText ?? this.amountText,
      quantityText: quantityText ?? this.quantityText,
      orderAmount: orderAmount ?? this.orderAmount,
      netAmountToPay: netAmountToPay ?? this.netAmountToPay,
      transactionFee: transactionFee ?? this.transactionFee,
      platformFee: platformFee ?? this.platformFee,

      // fees in full view
      feesViewStates: feesViewStates ?? this.feesViewStates,
      totalFees: totalFees ?? this.totalFees,
      stockPrice: stockPrice ?? this.stockPrice,
      transactionId: transactionId ?? this.transactionId,
      sellIFSCAFee: sellIFSCAFee ?? this.sellIFSCAFee,
      sellHoldingState: sellHoldingState ?? this.sellHoldingState,
    );
  }
}
