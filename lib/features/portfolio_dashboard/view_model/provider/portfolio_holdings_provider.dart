import "package:aprreciate/features/portfolio_dashboard/view_model/notifier/portfolio_holdings_notifier.dart";
import "package:aprreciate/models/portfolio_holding_model/portfolio_holding_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final portfolioHoldingsProvider =
    NotifierProvider<PortfolioHoldingsNotifier, List<PortfolioHoldingCardModel>>(
      PortfolioHoldingsNotifier.new,
    );
