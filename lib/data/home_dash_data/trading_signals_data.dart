import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/models/home_dashboard/trading_signal_model.dart";

const trading_signals_data = [
  TradingSignalModel(
    stockIcon: AppAssets.apple_icon,
    stockSymbol: "APPL",
    currentPrice: '19,000',
    entryPrice: '20,000',
    exitPrice: '21,000',
    gain: '5',
    verdict: 'BUY'
  ),
  TradingSignalModel(
    stockIcon: AppAssets.tesla_icon,
    stockSymbol: "TSLA",
    currentPrice: '25,000',
    entryPrice: '24,000',
    exitPrice: '26,000',
    gain: '7',
    verdict: 'BUY'

  ),
  TradingSignalModel(
    stockIcon: AppAssets.google_icon,
    stockSymbol: "GOOGL",
    currentPrice: '31,000',
    entryPrice: '29,000',
    exitPrice: '33,000',
    gain: '9',
    verdict: 'BUY'
  ),
];
