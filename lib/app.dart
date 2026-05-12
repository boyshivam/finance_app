import "package:aprreciate/router/router_config.dart";
import "package:flutter/material.dart";
import "package:aprreciate/core/themes/app_theme/app_theme.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: appRouter,
        );
  }
}
