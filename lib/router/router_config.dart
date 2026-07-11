import "package:aprreciate/features/LRS_flow/view/presentation/confirm_remittance_screen.dart";
import "package:aprreciate/features/LRS_flow/view/presentation/lrs_screen.dart";
import "package:aprreciate/features/home_dashboard/view/screens/home_dashboard_screen.dart";
import "package:aprreciate/features/home_screen/home_screen.dart";
import "package:aprreciate/features/mobile_num_validator/view/presentations/mobile_num_screen.dart";
import "package:aprreciate/features/mobile_otp_validator/view/presentation/mobile_otp_screen.dart";
import "package:aprreciate/features/passcode/view/presentation/passcode_screen.dart";
import "package:aprreciate/features/search_dashboard/view/presentation/search_dashboard.dart";
import "package:aprreciate/features/stock_details_screen/view/presentation/stock_details_screen.dart";
import "package:aprreciate/features/trade_dashboard/view/presentation/order_placed_screen.dart";
import "package:aprreciate/features/trade_dashboard/view/presentation/trade_screen.dart";

import "package:aprreciate/router/app_routes.dart";
import "package:go_router/go_router.dart";

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.loginScreen,
      builder: (context, state) => MobileNumScreen(),
    ),
    GoRoute(
      path: AppRoutes.otpScreen,
      builder: (context, state) => MobileOtpScreen(),
    ),
    GoRoute(
      path: AppRoutes.passcodeScreen,
      builder: (context, state) => PasscodeScreen(),
    ),
    GoRoute(
      path: AppRoutes.homeDashboardScreen,
      builder: (context, state) => HomeDashboardScreen(),
    ),
    GoRoute(
      path: AppRoutes.searchDashboardScreen,
      builder: (context, state) => SearchDashboardScreen(),
    ),

    GoRoute(
      path: AppRoutes.homeScreen,
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      path: AppRoutes.tradeScreen,
      builder: (context, state) => TradeScreen(),
    ),

    GoRoute(
      path: AppRoutes.stockDetailsScreen,
      builder: (context, state) => StockDetailsScreen(),
    ),

    GoRoute(
      path: AppRoutes.orderPlacedScreen,
      builder: (context, state) => OrderPlacedScreen(),
    ),

    GoRoute(
      path: AppRoutes.lrsScreen,
      builder: (context, state) => LrsScreen(),
    ),

    GoRoute(path: AppRoutes.confirmRemittanceScreen,
    builder: (context, state) => ConfirmRemittanceScreen()),

  ],
);
