import 'package:aprreciate/features/LRS_flow/enums/order_validity_states.dart';
import 'package:aprreciate/features/LRS_flow/enums/remitanceValidityCheck.dart';
import 'package:aprreciate/features/LRS_flow/enums/textfield_states.dart';
import 'package:aprreciate/features/LRS_flow/enums/us_wallet_order_enum.dart';
import 'package:aprreciate/features/LRS_flow/source_of_funds_enums.dart';

class LrsScreenState {
  const LrsScreenState({
    required this.walletBalance,
    required this.enteredAmount,
    required this.enteredAmountDouble,
    required this.submitClicked,
    required this.currentBankBalance,
    required this.amountFieldStates,
    required this.fxRate,
    required this.processingDate,
    required this.orderValidityStates,
    required this.remittanceValidityCheck,
    required this.sourceOfFunds,
    required this.selectedFundSource,
    required this.bankBalanceInUSD,
    required this.orderType,
  });

  final double walletBalance;
  final String enteredAmount;
  final double enteredAmountDouble;
  final bool submitClicked;
  final List<Map<SourceOfFundsEnums, String>> sourceOfFunds;
  final SourceOfFundsEnums selectedFundSource;
  final double currentBankBalance;
  final TextFieldStates amountFieldStates;
  final double fxRate;
  final String processingDate;
  final OrderValidityStates orderValidityStates;
  final RemittanceValidityCheck remittanceValidityCheck;
  final double bankBalanceInUSD;
  final UsWalletOrderEnum orderType;

  LrsScreenState copyWith({
    double? walletBalance,
    String? enteredAmount,
    double? enteredAmountDouble,
    bool? submitClicked,
    List<Map<SourceOfFundsEnums, String>>? sourceOfFunds,
    SourceOfFundsEnums? selectedFundSource,
    double? currentBankBalance,
    TextFieldStates? amountFieldStates,
    double? fxRate,
    String? processingDate,
    OrderValidityStates? orderValidityStates,
    RemittanceValidityCheck? remittanceValidityCheck,
    double? bankBalanceInUSD,
    UsWalletOrderEnum? orderType,
  }) {
    return LrsScreenState(
      walletBalance: walletBalance ?? this.walletBalance,
      selectedFundSource: selectedFundSource ?? this.selectedFundSource,
      submitClicked: submitClicked ?? this.submitClicked,
      sourceOfFunds: sourceOfFunds ?? this.sourceOfFunds,
      enteredAmount: enteredAmount ?? this.enteredAmount,
      enteredAmountDouble: enteredAmountDouble ?? this.enteredAmountDouble,
      currentBankBalance: currentBankBalance ?? this.currentBankBalance,
      amountFieldStates: amountFieldStates ?? this.amountFieldStates,
      fxRate: fxRate ?? this.fxRate,
      processingDate: processingDate ?? this.processingDate,
      remittanceValidityCheck:
          remittanceValidityCheck ?? this.remittanceValidityCheck,
      orderValidityStates: orderValidityStates ?? this.orderValidityStates,
      bankBalanceInUSD: bankBalanceInUSD ?? this.bankBalanceInUSD,
      orderType: orderType ?? this.orderType,
    );
  }
}
