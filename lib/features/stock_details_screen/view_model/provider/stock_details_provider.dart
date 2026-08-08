import "package:aprreciate/features/stock_details_screen/view_model/notifier/stock_details_notifier.dart";
import "package:aprreciate/features/stock_details_screen/view_model/stock_details_state/stock_details_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final stockDetailsProvider =
    NotifierProvider<StockDetailsNotifier, StockDetailsState>(
      StockDetailsNotifier.new,
    );
