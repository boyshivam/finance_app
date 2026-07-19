import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_assets/assets_home_dashboard/top_etf_icons_assets/etf_icons_assets.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final commonSecuritiesProvider = Provider((ref) {
  return [
    StockCardModel(
      stockName: 'Apple',
      stockSymbol: 'APPL',
      stockIcon: AppAssets.apple_icon,
      value: 298,
      valueChange: 21,
      valueChangePerc: 2.1,
      valueChangeIcon: true,
      isFavourite: false,
    ),
    StockCardModel(
      stockName: 'Tesla',
      stockSymbol: 'TSLA',
      stockIcon: AppAssets.tesla_icon,
      value: 399,
      valueChange: 34.98,
      valueChangePerc: 9.9,
      valueChangeIcon: false,
      isFavourite: false,
    ),
    StockCardModel(
      stockName: 'Amazon',
      stockSymbol: 'AZN',
      stockIcon: AppAssets.amazon_icon,
      value: 268,
      valueChange: 17,
      valueChangePerc: 3.4,
      valueChangeIcon: true,
      isFavourite: false,
    ),
    StockCardModel(
      stockName: 'Microsoft',
      stockSymbol: 'MSFT',
      stockIcon: AppAssets.microsoft_icon,
      value: 281,
      valueChange: 12.2,
      valueChangePerc: 7.1,
      valueChangeIcon: true,
      isFavourite: false,
    ),
    StockCardModel(
      stockName: 'Google',
      stockSymbol: 'GOOGL',
      stockIcon: AppAssets.google_icon,
      value: 311,
      valueChange: 21.2,
      valueChangePerc: 8.1,
      valueChangeIcon: false,
      isFavourite: false,
    ),

    StockCardModel(
      stockName: 'Diamond company',
      stockSymbol: 'DIA',
      stockIcon: EtfIconAssets.etf_DIA_icon,
      value: 391,
      valueChange: 11.2,
      valueChangePerc: 5.1,
      valueChangeIcon: true,
      isFavourite: false,
    ),
    StockCardModel(
      stockName: 'Voodoo child',
      stockSymbol: 'VOO',
      stockIcon: EtfIconAssets.etf_VOO_icon,
      value: 389,
      valueChange: 41.2,
      valueChangePerc: 2.1,
      valueChangeIcon: false,
      isFavourite: false,
    ),
  ];
});
