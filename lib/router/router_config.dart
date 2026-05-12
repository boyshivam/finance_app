import "package:aprreciate/presentation/screens/home_dashboard/home_dashboard_screen.dart";
import "package:aprreciate/presentation/screens/login_module/login_otp_screen.dart";
import "package:aprreciate/features/passcode/view/presentation/passcode_screen.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:go_router/go_router.dart";
import "package:flutter/material.dart";
import "package:aprreciate/presentation/screens/login_module/login_number_screen.dart";



final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: AppRoutes.loginScreen, builder: (context, state) => LoginScreen()),
    GoRoute(path: AppRoutes.otpScreen, builder: (context, state) => LoginOTPScreen()),
    GoRoute(path: AppRoutes.passcodeScreen, builder: (context, state) => PasscodeScreen()),
    GoRoute(path: AppRoutes.homeDashboardScreen, builder: (context, state) => HomeDashboardScreen())
  ],
);
