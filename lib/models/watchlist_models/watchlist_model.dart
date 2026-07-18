
import 'package:aprreciate/models/stocks_model/stock_card_model.dart';

class WatchlistModel {
  const WatchlistModel({
    required this.watchlistName,
    required this.stocks
});

  final String watchlistName;
  final List<StockCardModel> stocks;
}