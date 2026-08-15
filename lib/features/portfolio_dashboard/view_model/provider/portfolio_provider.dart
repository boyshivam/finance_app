import "package:aprreciate/features/portfolio_dashboard/view_model/notifier/portfolio_notifier.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/state/portfolio_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final portfolioProvider = NotifierProvider<PortfolioNotifier, PortfolioState>(
  PortfolioNotifier.new,
);
