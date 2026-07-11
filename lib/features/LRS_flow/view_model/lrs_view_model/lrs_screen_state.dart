import 'package:aprreciate/features/LRS_flow/enums/order_validity_states.dart';
import 'package:aprreciate/features/LRS_flow/enums/remitanceValidityCheck.dart';
import 'package:aprreciate/features/LRS_flow/enums/textfield_states.dart';

class LrsScreenState {
  const LrsScreenState({
    required this.amountText,
    required this.currentYesBalance,
    required this.amountFieldStates,
    required this.fxRate,
    required this.processingDate,
    required this.orderValidityStates,
    required this.remittanceValidityCheck,
    required this.sourceOfFunds,
    required this.selectedFundSource,
  });

  final String amountText;
  final List<String> sourceOfFunds;
  final String? selectedFundSource;
  final double currentYesBalance;
  final TextFieldStates amountFieldStates;
  final double fxRate;
  final String processingDate;
  final OrderValidityStates orderValidityStates;
  final RemittanceValidityCheck remittanceValidityCheck;

  LrsScreenState copyWith({
    String? amountText,
    List<String>? sourceOfFunds,
    String? selectedFundSource,
    double? currentYesBalance,
    TextFieldStates? amountFieldStates,
    double? fxRate,
    String? processingDate,
    OrderValidityStates? orderValidityStates,
    RemittanceValidityCheck? remittanceValidityCheck,
  }) {
    return LrsScreenState(
      selectedFundSource: selectedFundSource ?? this.selectedFundSource,
      sourceOfFunds: sourceOfFunds ?? this.sourceOfFunds,
      amountText: amountText ?? this.amountText,
      currentYesBalance: currentYesBalance ?? this.currentYesBalance,
      amountFieldStates: amountFieldStates ?? this.amountFieldStates,
      fxRate: fxRate ?? this.fxRate,
      processingDate: processingDate ?? this.processingDate,
      remittanceValidityCheck:
          remittanceValidityCheck ?? this.remittanceValidityCheck,
      orderValidityStates: orderValidityStates ?? this.orderValidityStates,
    );
  }
}
