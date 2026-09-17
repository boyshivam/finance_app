import 'package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/fees_view_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/order_eligibility_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/text_field_error_message_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/trade_fields_states.dart';
import 'package:aprreciate/features/trade_dashboard/enums/trade_type_enum.dart';
import 'package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart';

class TradeScreenState {
  const TradeScreenState({
    required this.securityName,
    required this.securitySymbol,
    required this.securityIcon,
    required this.tradeType,
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
    required this.totalOrderValue,
    required this.transactionFee,
    required this.platformFee,
    required this.amountPayable,
    required this.usWalletBalance,
    required this.orderEligibility,
    required this.feesViewStates,
    required this.totalFees,
    required this.stockPrice,
    required this.transactionId,
    required this.sellIFSCAFee,
  });

  final String securityName;
  final String securitySymbol;
  final String securityIcon;
  final TradeTypeEnum tradeType;
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
  final double totalOrderValue;
  final double amountPayable;
  final double transactionFee;
  final double platformFee;
  final double sellIFSCAFee;
  final OrderEligibilityStates orderEligibility;
  final FeesViewStates feesViewStates;
  final double totalFees;
  final double stockPrice;
  final String transactionId;

  TradeScreenState copyWith({
    String? securityName,
    String? securitySymbol,
    String? securityIcon,
    TradeTypeEnum? tradeType,
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
    double? totalOrderValue,
    double? amountPayable,
    double? transactionFee,
    double? platformFee,

    OrderEligibilityStates? orderEligibility,
    FeesViewStates? feesViewStates,
    double? totalFees,
    double? stockPrice,
    String? transactionId,
    double? sellIFSCAFee,
  }) {
    return TradeScreenState(
      securityName: securityName ?? this.securityName,
      securitySymbol: securitySymbol ?? this.securitySymbol,
      securityIcon: securityIcon ?? this.securityIcon,
      tradeType: tradeType ?? this.tradeType,
      usWalletFundsState: usWalletFundsState ?? this.usWalletFundsState,
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
      usWalletBalance: usWalletBalance ?? this.usWalletBalance,

      // amount texts
      amountText: amountText ?? this.amountText,
      quantityText: quantityText ?? this.quantityText,
      totalOrderValue: totalOrderValue ?? this.totalOrderValue,
      amountPayable: amountPayable ?? this.amountPayable,
      transactionFee: transactionFee ?? this.transactionFee,
      platformFee: platformFee ?? this.platformFee,

      // fees in full view
      feesViewStates: feesViewStates ?? this.feesViewStates,
      totalFees: totalFees ?? this.totalFees,
      stockPrice: stockPrice ?? this.stockPrice,
      transactionId: transactionId ?? this.transactionId,
      sellIFSCAFee: sellIFSCAFee ?? this.sellIFSCAFee,
    );
  }
}
