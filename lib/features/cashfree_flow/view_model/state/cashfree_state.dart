import 'package:aprreciate/features/cashfree_flow/enums/cashfree_UI_state.dart';

class CashFreeState {
  const CashFreeState({
    required this.enteredAmount,
    required this.bankBalance,
    required this.amountFieldState,
    required this.upiFieldState,
    required this.upiID,
    required this.submitClicked,
  });

  final String enteredAmount;
  final double bankBalance;
  final CashFreeUIState amountFieldState;
  final CashFreeUIState upiFieldState;
  final String upiID;
  final bool submitClicked;

  CashFreeState copyWith({
    String? enteredAmount,
    double? bankBalance,
    CashFreeUIState? amountFieldState,
    CashFreeUIState? upiFieldState,
    String? upiID,
    bool? submitClicked,
  }) {
    return CashFreeState(
      enteredAmount: enteredAmount ?? this.enteredAmount,
      bankBalance: bankBalance ?? this.bankBalance,
      amountFieldState: amountFieldState ?? this.amountFieldState,
      upiFieldState: upiFieldState ?? this.upiFieldState,
      upiID: upiID ?? this.upiID,
      submitClicked: submitClicked ?? this.submitClicked,
    );
  }
}
