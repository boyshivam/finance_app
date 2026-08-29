import 'package:aprreciate/features/LRS_flow/enums/order_validity_states.dart';
import 'package:aprreciate/features/LRS_flow/enums/remitanceValidityCheck.dart';
import 'package:aprreciate/features/LRS_flow/enums/textfield_states.dart';

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
  });

  final double walletBalance;
  final String enteredAmount;
  final double enteredAmountDouble;
  final bool submitClicked;
  final List<String> sourceOfFunds;
  final String? selectedFundSource;
  final double currentBankBalance;
  final TextFieldStates amountFieldStates;
  final double fxRate;
  final String processingDate;
  final OrderValidityStates orderValidityStates;
  final RemittanceValidityCheck remittanceValidityCheck;
  final double bankBalanceInUSD;

  LrsScreenState copyWith({
    double? walletBalance,
    String? enteredAmount,
    double? enteredAmountDouble,
    bool? submitClicked,
    List<String>? sourceOfFunds,
    String? selectedFundSource,
    double? currentBankBalance,
    TextFieldStates? amountFieldStates,
    double? fxRate,
    String? processingDate,
    OrderValidityStates? orderValidityStates,
    RemittanceValidityCheck? remittanceValidityCheck,
    double? bankBalanceInUSD,
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
    );
  }
}
