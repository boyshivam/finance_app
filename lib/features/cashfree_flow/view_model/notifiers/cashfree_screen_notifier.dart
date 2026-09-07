import "package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart";
import "package:aprreciate/core/utils/helper_widgets/transactionID_generator.dart";
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
      orderStatus: OrderStageEnums.submitted,
      transactionID: getTransactionID,
    );
  }

  // random transaction id generator
  String get getTransactionID => RandomOrderIdGenerator.generateId();

  // get the entered amount by user
  void retrieveEnteredAmount(String amount) {
    state = state.copyWith(enteredAmount: amount);
  }

  // get the entered upi id by user
  void retrieveEnteredUpiID(String upi) {
    state = state.copyWith(upiID: upi);
  }

  // deduct from bank balance
  void deductBankBalanceOnLrs(double lrsAmount){
    state = state.copyWith(
      bankBalance: state.bankBalance - lrsAmount
    );
  }

  // add new amount to bank balance
  void addAmountToBankBalance() {
    double latestBankBalance =
        state.bankBalance + double.parse(state.enteredAmount);

    state = state.copyWith(bankBalance: latestBankBalance);
  }

  // add the transaction details to orders list
  void addToOrdersList() {
    final cashFreeOrdersNotifier = ref.read(cashFreeOrdersProvider.notifier);
    addAmountToBankBalance();

    final CashFreeCardModel newOrder = CashFreeCardModel(
      amount: state.enteredAmount,
      transactionID: state.transactionID,
      upiID: state.upiID,
      orderStatus: state.orderStatus,
    );

    cashFreeOrdersNotifier.addCashFreeOrder(newOrder);
  }
}
