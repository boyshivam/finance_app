import 'package:aprreciate/models/stocks_model/stock_card_model.dart';

class IndividualWatchlistModel {
  const IndividualWatchlistModel({required this.watchlistName, this.securities = const []});

  final String watchlistName;
  final List<StockCardModel> securities;
}
