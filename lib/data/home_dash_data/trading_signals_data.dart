import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/models/home_dashboard/trading_signal_model.dart";

const trading_signals_data = [
  TradingSignalModel(
    stockIcon: AppAssets.apple_icon,
    stockSymbol: "APPL",
    currentPrice: 19000,
    entryPrice: 20000,
    exitPrice: 21000,
    gain: 5,
  ),
  TradingSignalModel(
    stockIcon: AppAssets.tesla_icon,
    stockSymbol: "TSLA",
    currentPrice: 25000,
    entryPrice: 24000,
    exitPrice: 26000,
    gain: 7,
  ),
  TradingSignalModel(
    stockIcon: AppAssets.google_icon,
    stockSymbol: "GOOGL",
    currentPrice: 31000,
    entryPrice: 29000,
    exitPrice: 33000,
    gain: 9,
  ),
  TradingSignalModel(
    stockIcon: AppAssets.microsoft_icon,
    stockSymbol: "MSFT",
    currentPrice: 22000,
    entryPrice: 21000,
    exitPrice: 23000,
    gain: 6,
  ),
  TradingSignalModel(
    stockIcon: AppAssets.amazon_icon,
    stockSymbol: "AMZN",
    currentPrice: 19000,
    entryPrice: 20000,
    exitPrice: 21000,
    gain: 5,
  ),
];
