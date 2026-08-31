import "dart:math";
import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/provider/portfolio_holdings_provider.dart";
import "package:aprreciate/features/profile_dashboard/view_model/view_model_orders/providers/orders_provider.dart";
import "package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/fees_view_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/order_eligibility_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/text_field_error_message_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_fields_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_type_enum.dart";
import "package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_ screen_state.dart";
import "package:aprreciate/models/portfolio_holding_model/portfolio_holding_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeScreenNotifier extends Notifier<TradeScreenState> {
  @override
  TradeScreenState build() {

    // lrs state provider to fetch US wallet balance
    final vmLrs = ref.watch(lrsProvider);

    // TODO: implement build
    return TradeScreenState(

      securityName: "",
      securitySymbol: "",
      securityIcon: "",
      tradeType: TradeTypeEnum.buyFraction,
      usWalletFundsState: UsWalletFundsState.sufficientFunds,
      amountTextFieldState: TextFieldsStates.neutral,
      quantityTextFieldState: TextFieldsStates.neutral,
      amountTextFieldErrorMessageState: TextFieldErrorMessageState.neutral,
      quantityTextFieldErrorMessageState: TextFieldErrorMessageState.neutral,
      currencyToggleState: CurrencyToggleState.toggledUsd,
      usWalletBalance: vmLrs.walletBalance,
      quantityByAmount: 0,
      amountByQuantity: 0,
      convertedValue: 0,
      amountText: "",
      quantityText: "",
      orderValueText: "",
      amountPayable: "",
      transactionFee: "",
      platformFee: "",
      orderEligibility: OrderEligibilityStates.invalid,
      feesViewStates: FeesViewStates.partialView,
      totalFees: "",
      stockPrice: AppStringsCommon.stockTeslaPrice,
    );
  }

  get enteredAmount => double.tryParse(state.amountText) ?? 0;

  get enteredQuantity => double.tryParse(state.quantityText) ?? 0;

  // this alters the state of currency toggle
  void toggleCurrency() {
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
    // quantity to be display in quantity field
    final securedQuantity = (enteredAmount / state.stockPrice).toStringAsFixed(
      2,
    );
    state = state.copyWith(quantityText: securedQuantity);
  }

  // show amount secured by entered quantity in the quantity text field
  void amountByQuantity() {
    // this is amount to be displayed in the amount field
    final securedAmount = (enteredQuantity * state.stockPrice).toStringAsFixed(
      2,
    );
    state = state.copyWith(amountText: securedAmount);
  }

  // check if sufficient us wallet balance
  void checkSufficientUsWalletBalance() {
    final enteredAmount = double.tryParse(state.amountText) ?? 0;

    state = state.copyWith(
      usWalletFundsState: (enteredAmount <= state.usWalletBalance)
          ? UsWalletFundsState.sufficientFunds
          : UsWalletFundsState.insufficientFunds,
    );
  }

  // get security details
  void getSecurityDetails(String name, String symbol, String icon){
    state = state.copyWith(
      securityName: name,
      securitySymbol: symbol,
      securityIcon: icon
    );
  }

  //  place trade orders
  void placeOrder() {
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
    } else if (double.tryParse(enteredAmount)! <= state.usWalletBalance) {
      state = state.copyWith(
        amountTextFieldErrorMessageState: TextFieldErrorMessageState.active,
        amountTextFieldState: TextFieldsStates.active,
        usWalletFundsState: UsWalletFundsState.sufficientFunds,
        orderEligibility: OrderEligibilityStates.valid,
      );
      ref.read(ordersProvider.notifier).addOrderDetailsToCard();
      addSecurityToPortfolio();
    }
  }

  // fees view dropdown
  void feesViewDropdown() {
    final currentState = state.feesViewStates;

    state = state.copyWith(
      feesViewStates: currentState == FeesViewStates.partialView
          ? FeesViewStates.fullView
          : FeesViewStates.partialView,
    );
  }

  // check the validity of purchase orders which weighs on USWallet balance, and entered amount
  bool validatePurchase() {
    return state.usWalletBalance >= enteredAmount && enteredAmount != 0;
  }

  // fees for the entered amount
  void calculateFees() {
    double platformFee = (enteredAmount / state.stockPrice).ceil() * 0.01;
    final transactionFee = max(0.05, (0.05 / 100) * enteredAmount);

    state = state.copyWith(
      totalFees: (platformFee + transactionFee).toStringAsFixed(2),
      orderValueText: enteredAmount.toString(),
      amountPayable: (enteredAmount + transactionFee).toStringAsFixed(2),
      transactionFee: transactionFee.toStringAsFixed(2),
      platformFee: platformFee.toStringAsFixed(2),
    );
  }

  // add investment to portfolio or add investment to exiting portfolio
  void addSecurityToPortfolio() {
    double securityPrice = state.stockPrice;
    double purchaseAmount = double.tryParse(state.amountText) ?? 0;
    double purchaseQuantity = double.tryParse(state.quantityText) ?? 0;
    double averageCost = purchaseAmount / purchaseQuantity;
    double totalPnL = (securityPrice - averageCost) * purchaseQuantity;

    final newHolding = PortfolioHoldingCardModel(
      securityName: state.securityName,
      securityIcon: state.securityIcon,
      securitySymbol: state.securitySymbol,
      securityPrice: securityPrice,
      investedAmount: purchaseAmount,
      purchasedQuantity: purchaseQuantity,
      average: averageCost,
      totalPnL: totalPnL,
    );

    final holdingsNotifier = ref.read(portfolioHoldingsProvider.notifier);
    holdingsNotifier.addHolding(
      newHolding: newHolding,
      securitySymbol: state.securitySymbol,
    );
  }

  // reset orders
  void resetOrderValidity() {
    state = state.copyWith(orderEligibility: OrderEligibilityStates.invalid);
  }
}
