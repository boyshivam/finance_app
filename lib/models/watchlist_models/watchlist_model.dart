import 'package:aprreciate/models/watchlist_models/individual_watchlist_card_model.dart';

class WatchlistModel {
  const WatchlistModel({required this.watchlistName, this.securities = const []});

  final String watchlistName;
  final List<IndividualWatchlistCardModel> securities;
}
