import 'package:aprreciate/models/stocks_model/stock_card_model.dart';
import "package:uuid/uuid.dart";

const uuid = Uuid();

class IndividualWatchlistModel {
  IndividualWatchlistModel({
    String? watchlistId,
    required this.watchlistName,
    this.securities = const [],
  }) : watchlistId = watchlistId ?? uuid.v4();

  final String watchlistId;
  final String watchlistName;
  final List<StockCardModel> securities;

  IndividualWatchlistModel copyWith({
    String? watchlistName,
    String? watchlistId,
    List<StockCardModel>? securities,
  }) {
    return IndividualWatchlistModel(
      watchlistName: watchlistName ?? this.watchlistName,
      watchlistId: watchlistId ?? this.watchlistId,
      securities: securities ?? this.securities,
    );
  }
}
