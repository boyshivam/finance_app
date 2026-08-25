import 'package:aprreciate/features/cashfree_flow/enums/cashfree_UI_state.dart';

class CashFreeState {
  const CashFreeState({
    required this.bankBalance,
    required this.amountFieldState,
    required this.upiFieldState,
    required this.upiID,
  });

  final double bankBalance;
  final CashFreeUIState amountFieldState;
  final CashFreeUIState upiFieldState;
  final String upiID;

  CashFreeState copyWith({
    double? bankBalance,
    CashFreeUIState? amountFieldState,
    CashFreeUIState? upiFieldState,
    String? upiID,
  }) {
    return CashFreeState(
      bankBalance: bankBalance ?? this.bankBalance,
      amountFieldState: amountFieldState ?? this.amountFieldState,
      upiFieldState: upiFieldState ?? this.upiFieldState,
      upiID: upiID ?? this.upiID,
    );
  }
}
