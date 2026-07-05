import 'package:aprreciate/features/LRS_flow/enums/textfield_states.dart';

class LrsScreenState {
  const LrsScreenState({
    required this.amountText,
    required this.currentYesBalance,
    required this.amountFieldStates,
    required this.fxRate,
    required this.processingDate
  });

  final String amountText;
  final double currentYesBalance;
  final TextFieldStates amountFieldStates;
  final double fxRate;
  final String processingDate;

  LrsScreenState copyWith({
    String? amountText,
    double? currentYesBalance,
    TextFieldStates? amountFieldStates,
    double? fxRate,
    String? processingDate


  }) {
    return LrsScreenState(
      amountText: amountText ?? this.amountText,
      currentYesBalance: currentYesBalance ?? this.currentYesBalance,
      amountFieldStates: amountFieldStates ?? this.amountFieldStates,
      fxRate: fxRate ?? this.fxRate,
      processingDate: processingDate ?? this.processingDate
    );
  }
}
