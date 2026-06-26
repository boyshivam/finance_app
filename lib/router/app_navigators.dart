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

  static void goToTradeScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.tradeScreen, extra: extra);
  }

  static void gotToOrderPlacedScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.orderPlacedScreen, extra: extra);
  }

  static void gotoAddFundsToWalletScreen(BuildContext context, {Object? extra}) {
    context.push(AppRoutes.addFundsToWallet, extra: extra);
  }

}
