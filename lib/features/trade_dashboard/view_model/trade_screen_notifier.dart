import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/order_eligibility_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/text_field_error_message_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_fields_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_ screen_state.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeScreenNotifier extends Notifier<TradeScreenState> {
  @override
  TradeScreenState build() {
    // TODO: implement build
    return TradeScreenState(
      usWalletFundsState: UsWalletFundsState.sufficientFunds,
      amountTextFieldState: TextFieldsStates.neutral,
      quantityTextFieldState: TextFieldsStates.neutral,
      amountTextFieldErrorMessageState: TextFieldErrorMessageState.neutral,
      quantityTextFieldErrorMessageState: TextFieldErrorMessageState.neutral,
      currencyToggleState: CurrencyToggleState.toggledUsd,
      usWalletBalance: AppStringsCommon.usWalletBalance,
      quantityByAmount: 0,
      amountByQuantity: 0,
      convertedValue: 0,
      amountText: "",
      quantityText: "",
      orderValueText: "",
      orderEligibility: OrderEligibilityStates.invalid
    );
  }

  // this alters the state of currency toggle
  void toggleCurrency() {
    // entered input by the user
    final enteredAmount = double.tryParse(state.amountText) ?? 0;

    final isUsd = state.currencyToggleState == CurrencyToggleState.toggledUsd;

    state = state.copyWith(
      currencyToggleState: isUsd
          ? CurrencyToggleState.toggledInr
          : CurrencyToggleState.toggledUsd,
      amountText:
          (isUsd
                  ? enteredAmount * AppStringsCommon.currentFxRate
                  : enteredAmount / AppStringsCommon.currentFxRate)
              .toStringAsFixed(2),
    );
  }

  // derive quantity from quantity controller
  void deriveQuantity(String value) {
    state = state.copyWith(quantityText: value);
  }

  // derive amount from the amount controller
  void deriveAmount(String value) {
    state = state.copyWith(amountText: value);
  }

  // shown quantity secured for the entered amount in the quantity textfield -
  void quantityByAmount() {
    // entered amount
    final enteredAmount = double.tryParse(state.amountText) ?? 0;

    // current price of the stock
    final stockPrice = double.tryParse(AppStringsCommon.stockTeslaPrice) ?? 0;

    // quantity to be display in quantity field
    final securedQuantity = (enteredAmount / stockPrice).toStringAsFixed(2);

    state = state.copyWith(quantityText: securedQuantity);
  }

  // show amount secured by entered quantity in the quantity textfield
  void amountByQuantity() {
    // this is hte entered quantity
    final enteredQuantity = double.tryParse(state.quantityText) ?? 0;

    // current price of stock
    final stockPrice = double.tryParse(AppStringsCommon.stockTeslaPrice) ?? 0;

    // this is amount to be displayed in the amount field
    final securedAmount = (enteredQuantity * stockPrice).toStringAsFixed(2);

    state = state.copyWith(amountText: securedAmount);
  }

  // check if fields empty
  void checkOrderValidity() {
    final enteredAmount = state.amountText;

    if (enteredAmount.trim().isEmpty) {
      state = state.copyWith(
        amountTextFieldState: TextFieldsStates.empty,
        amountTextFieldErrorMessageState: TextFieldErrorMessageState.empty,
      );
      return;
    } else if (double.tryParse(enteredAmount) == 0) {
      state = state.copyWith(
        amountTextFieldState: TextFieldsStates.zero,
        amountTextFieldErrorMessageState: TextFieldErrorMessageState.zero,
      );
      return;
    } else if (double.tryParse(enteredAmount)! > state.usWalletBalance) {
      state = state.copyWith(
        amountTextFieldState: TextFieldsStates.error,
        amountTextFieldErrorMessageState: TextFieldErrorMessageState.error,
        usWalletFundsState: UsWalletFundsState.insufficientFunds,
        orderEligibility: OrderEligibilityStates.invalid
      );
      return ;
    }
    else if (double.tryParse(enteredAmount)! <= state.usWalletBalance){
      state = state.copyWith(
        amountTextFieldErrorMessageState: TextFieldErrorMessageState.active,
        amountTextFieldState: TextFieldsStates.active,
        usWalletFundsState: UsWalletFundsState.sufficientFunds,
        orderEligibility: OrderEligibilityStates.valid
      );
    }
  }

  // check if sufficient balance


  // validate purchase
  void placeOrder() {
    final enteredAmount = double.tryParse(state.amountText) ?? 0;

    final sufficientFunds = enteredAmount <= state.usWalletBalance;

    state = state.copyWith(
      usWalletFundsState: sufficientFunds
          ? UsWalletFundsState.sufficientFunds
          : UsWalletFundsState.insufficientFunds,
    );
  }
}
