import "package:aprreciate/core/utils/helper_widgets/transactionID_generator.dart";
import "package:aprreciate/features/cashfree_flow/enums/cash_free_order_status.dart";
import "package:aprreciate/features/cashfree_flow/enums/cashfree_UI_state.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_orders_provider.dart";
import "package:aprreciate/features/cashfree_flow/view_model/state/cashfree_state.dart";
import "package:aprreciate/models/profile_models/cashfree/cashfree_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CashFreeScreenNotifier extends Notifier<CashFreeScreenState> {
  @override
  CashFreeScreenState build() {
    return CashFreeScreenState(
      bankBalance: 0,
      enteredAmount: "",
      upiID: "",
      amountFieldState: CashFreeUIState.neutral,
      upiFieldState: CashFreeUIState.neutral,
      submitClicked: false,
      orderStatus: CashFreeOrderStatusEnums.submitted
    );
  }

  // get the entered amount by user
  void retrieveEnteredAmount(String amount) {
    state = state.copyWith(enteredAmount: amount);
  }

  // get the entered upi id by user
  void retrieveEnteredUpiID(String upi) {
    state = state.copyWith(upiID: upi);
  }

  // validate entered inputs
  void validateEnteredAmount() {
    final enteredAmountDouble = double.tryParse(state.enteredAmount) ?? 0;
    final enteredAmountText = state.enteredAmount.toString();

    if (enteredAmountText
        .trim()
        .isEmpty) {
      state = state.copyWith(
        amountFieldState: CashFreeUIState.empty,
        submitClicked: true,
      );
    } else if (enteredAmountDouble == 0) {
      state = state.copyWith(
        amountFieldState: CashFreeUIState.invalid,
        submitClicked: true,
      );
    } else if (enteredAmountDouble > 0) {
      state = state.copyWith(
          amountFieldState: CashFreeUIState.valid,
          submitClicked: true,
          bankBalance: enteredAmountDouble
      );
    }
  }

  // validate entered UPI ID
  void validateEnteredUpiID() {
    final upiID = state.upiID;
    final upiIDSplits = upiID
        .split("@")
        .length;

    if (upiID.isEmpty) {
      state = state.copyWith(
        upiFieldState: CashFreeUIState.empty,
        submitClicked: true,
      );
    } else if (upiIDSplits > 2 || upiIDSplits < 2) {
      state = state.copyWith(
        submitClicked: true,
        upiFieldState: CashFreeUIState.invalid,
      );
    } else {
      state = state.copyWith(
        upiFieldState: CashFreeUIState.valid,
        submitClicked: true,
      );
    }
  }


  // add the transaction details to orders list
  void addToOrdersList() {

    final cashFreeOrdersNotifier = ref.read(cashFreeOrdersProvider.notifier);

    final CashFreeCardModel newOrder = CashFreeCardModel(
        amount: state.enteredAmount,
        transactionID: RandomOrderIdGenerator.generateId(),
        upiID: state.upiID,
        orderStatus: state.orderStatus);

    cashFreeOrdersNotifier.addCashFreeOrder(newOrder);
  }

}
