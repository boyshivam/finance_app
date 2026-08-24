import 'package:aprreciate/features/trade_dashboard/enums/trade_type_enum.dart';
import 'package:aprreciate/models/stocks_model/stock_card_model.dart';

class TradeScreenArgs {
  const TradeScreenArgs({
    required this.selectedSecurity,
    required this.tradeType,
  });

  final StockCardModel selectedSecurity;
  final TradeTypeEnum tradeType;
}
