import "package:aprreciate/router/app_routes.dart";
import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";


class AppNavigators {

  // Login module navigator
  static void goToLogin(BuildContext context , {Object? extra}) {
    context.push(AppRoutes.loginScreen, extra: extra);
  }

  static void goToOTPScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.otpScreen, extra: extra);
  }

  // Passcode screen navigator
  static void goToPasscodeScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.passcodeScreen, extra: extra);
  }

  // Home Dashboard screen navigator
  static void goToHomeDashBoard(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.homeDashboardScreen, extra: extra);
}

  // Search Dashboard
  static void goToSearchDashboard(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.searchDashboardScreen, extra: extra);
  }

  static void goToHomeScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.homeScreen, extra: extra);
  }

  static void goToStockDetailsScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.stockDetailsScreen,extra: extra);
  }

  static void goToTradeScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.tradeScreen, extra: extra);
  }

  static void gotToOrderPlacedScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.orderPlacedScreen, extra: extra);
  }

  static void gotoLrsScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.lrsScreen, extra: extra);
  }

  static void goToConfirmRemittanceScreen(BuildContext context, {Object? extra}){
    context.push(AppRoutes.confirmRemittanceScreen, extra: extra);
  }

  static void goToTransactionSubmittedScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.transactionSubmittedScreen, extra: extra);
  }
}
