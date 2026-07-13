import "package:aprreciate/features/LRS_flow/view/presentation/confirm_remittance_screen.dart";
import "package:aprreciate/features/LRS_flow/view/presentation/lrs_screen.dart";
import "package:aprreciate/features/LRS_flow/view/presentation/transactions_submitted_screen.dart";
import "package:aprreciate/features/home_dashboard/view/screens/home_dashboard_screen.dart";
import "package:aprreciate/features/home_screen/home_screen.dart";
import "package:aprreciate/features/mobile_num_validator/view/presentations/mobile_num_screen.dart";
import "package:aprreciate/features/mobile_otp_validator/view/presentation/mobile_otp_screen.dart";
import "package:aprreciate/features/passcode/view/presentation/passcode_screen.dart";
import "package:aprreciate/features/portfolio_dashboard/view/presentation/PortfolioDashboardScreen.dart";
import "package:aprreciate/features/profile_dashboard/view/presentation/profile_screen.dart";
import "package:aprreciate/features/search_dashboard/view/presentation/search_dashboard.dart";
import "package:aprreciate/features/stock_details_screen/view/presentation/stock_details_screen.dart";
import "package:aprreciate/features/trade_dashboard/view/presentation/trade_screen.dart";
import "package:aprreciate/features/watchlist_dashboard/view/presentation/watchlist_dashboard.dart";

import "package:aprreciate/router/app_routes.dart";
import "package:go_router/go_router.dart";

final appRouter = GoRouter(
  routes: [


    // entire login section routers

    GoRoute(
      path: AppRoutes.loginScreen,
      name: 'mobileNumberScreen',
      builder: (context, state) => MobileNumScreen(),
    ),
    GoRoute(
      path: AppRoutes.otpScreen,
      name: "otpEntryScreen",
      builder: (context, state) => MobileOtpScreen(),
    ),
    GoRoute(
      path: AppRoutes.passcodeScreen,
      name: 'passcodeScreen',
      builder: (context, state) => PasscodeScreen(),
    ),

    // trade section

    GoRoute(
        path: AppRoutes.stockDetailsScreen,
        name: 'stockDetailsScreen',
        builder: (context, state) => StockDetailsScreen()
        ),
    GoRoute(
        path: AppRoutes.tradeScreen,
        name: 'tradeScreen',
        builder: (context, state) => TradeScreen()
    ),
    GoRoute(
        path: AppRoutes.lrsScreen,
        name: 'lrsScreen',
        builder: (context, state) => LrsScreen()
    ),

    GoRoute(
        path: AppRoutes.confirmRemittanceScreen,
        name: 'confirmRemittanceScreen',
        builder: (context, state) => ConfirmRemittanceScreen()
    ),


    GoRoute(
        path: AppRoutes.transactionSubmittedScreen,
        name: 'transactionSubmittedScreen',
        builder: (context, state) => TransactionsSubmittedScreen()
    ),




    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.homeDashboardScreen,
              builder: (_, __) => const HomeDashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.portfolioDashboardScreen,
              builder: (_, __) => const PortfolioDashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.searchDashboardScreen,
              builder: (_, __) => const SearchDashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.watchlistDashboardScreen,
              builder: (_, __) => const WatchlistDashboard(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profileDashboardScreen,
              builder: (_, __) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

// final GoRouter apppRouter = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: AppRoutes.loginScreen,
//       builder: (context, state) => MobileNumScreen(),
//     ),
//     GoRoute(
//       path: AppRoutes.otpScreen,
//       builder: (context, state) => MobileOtpScreen(),
//     ),
//     GoRoute(
//       path: AppRoutes.passcodeScreen,
//       builder: (context, state) => PasscodeScreen(),
//     ),
//     GoRoute(
//       path: AppRoutes.homeDashboardScreen,
//       builder: (context, state) => HomeDashboardScreen(),
//     ),
//     GoRoute(
//       path: AppRoutes.searchDashboardScreen,
//       builder: (context, state) => SearchDashboardScreen(),
//     ),
//
//     GoRoute(
//       path: AppRoutes.homeScreen,
//       builder: (context, state) => HomeScreen(),
//     ),
//
//     GoRoute(
//       path: AppRoutes.tradeScreen,
//       builder: (context, state) => TradeScreen(),
//     ),
//
//     GoRoute(
//       path: AppRoutes.stockDetailsScreen,
//       builder: (context, state) => StockDetailsScreen(),
//     ),
//
//     GoRoute(
//       path: AppRoutes.orderPlacedScreen,
//       builder: (context, state) => OrderPlacedScreen(),
//     ),
//
//     GoRoute(
//       path: AppRoutes.lrsScreen,
//       builder: (context, state) => LrsScreen(),
//     ),
//
//     GoRoute(
//       path: AppRoutes.confirmRemittanceScreen,
//       builder: (context, state) => ConfirmRemittanceScreen(),
//     ),
//   ],
// );
