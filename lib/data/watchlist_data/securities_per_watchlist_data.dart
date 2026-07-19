import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


class SecuritiesPerWatchlistNotifier
    extends Notifier<List<StockCardModel>> {

  @override
  List<StockCardModel> build() => [];

  void addSecurity(StockCardModel newSecurity) {
   state = [...state, newSecurity];
  }
}

final securitiesPerWatchlistProvider = NotifierProvider<
    SecuritiesPerWatchlistNotifier,
    List<StockCardModel>>(SecuritiesPerWatchlistNotifier.new);