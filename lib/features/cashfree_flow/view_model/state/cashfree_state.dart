import 'package:aprreciate/features/cashfree_flow/enums/cash_free_order_status.dart';
import 'package:aprreciate/features/cashfree_flow/enums/cashfree_UI_state.dart';

class CashFreeScreenState {
  const CashFreeScreenState({
    required this.enteredAmount,
    required this.bankBalance,
    required this.amountFieldState,
    required this.upiFieldState,
    required this.upiID,
    required this.submitClicked,
    required this.orderStatus,
  });

  final String enteredAmount;
  final double bankBalance;
  final CashFreeUIState amountFieldState;
  final CashFreeUIState upiFieldState;
  final String upiID;
  final bool submitClicked;
  final CashFreeOrderStatusEnums orderStatus;

  CashFreeScreenState copyWith({
    String? enteredAmount,
    double? bankBalance,
    CashFreeUIState? amountFieldState,
    CashFreeUIState? upiFieldState,
    String? upiID,
    bool? submitClicked,
    CashFreeOrderStatusEnums? orderStatus,
  }) {
    return CashFreeScreenState(
      enteredAmount: enteredAmount ?? this.enteredAmount,
      bankBalance: bankBalance ?? this.bankBalance,
      amountFieldState: amountFieldState ?? this.amountFieldState,
      upiFieldState: upiFieldState ?? this.upiFieldState,
      upiID: upiID ?? this.upiID,
      submitClicked: submitClicked ?? this.submitClicked,
      orderStatus: orderStatus ?? this.orderStatus,
    );
  }
}
