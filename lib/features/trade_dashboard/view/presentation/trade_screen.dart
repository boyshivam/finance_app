import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_type_enum.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/fees_section/trade_fees_section.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/order_placement_section/order_placment_section.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/purchase_section/purchase_section.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/security_details/security_details.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/trade%20_top_section/trade_top_section.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

class TradeScreen extends ConsumerStatefulWidget {
  const TradeScreen({
    super.key,
    required this.selectedSecurity,
    required this.tradeType,
  });

  final StockCardModel selectedSecurity;
  final TradeTypeEnum tradeType;

  @override
  ConsumerState<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends ConsumerState<TradeScreen> {
  // text editing controllers
  late TextEditingController amountController;
  late TextEditingController quantityController;

  late FocusNode amountNode;
  late FocusNode quantityNode;

  // initialise controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = TextEditingController();
    quantityController = TextEditingController();

    amountNode = FocusNode();
    quantityNode = FocusNode();
  }

  // dispose controllers
  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    quantityController.dispose();
    amountNode.dispose();
    quantityNode.dispose();
  }

  // this is to show snack bar message on currency toggle
  void currencyToggleSnackBarMessage() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Image.asset(AppAssetsCommon.snackBarTick, width: 25, height: 25),
            const SizedBox(width: 10),
            Text("Exchange rate is "),
          ],
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final vmState = ref.watch(tradeScreenProvider);

    // this will show snack bar message when currency toggle is triggered
    ref.listen<CurrencyToggleState>(
      tradeScreenProvider.select((state) => state.currencyToggleState),
      (previous, next) {
        if (previous != null && previous != next) {
          currencyToggleSnackBarMessage();
        }
      },
    );

    // this listens to the provider and updates the cursor position in the text-field
    ref.listen(tradeScreenProvider, (previous, next) {
      if (amountController.text != next.amountText) {
        amountController.text = next.amountText;

        amountController.selection = TextSelection.fromPosition(
          TextPosition(offset: amountController.text.length),
        );
      }

      if (amountController.text != next.quantityText) {
        quantityController.text = next.quantityText;

        quantityController.selection = TextSelection.fromPosition(
          TextPosition(offset: quantityController.text.length),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
      body: Column(
        children: [
          TradeTopSection(),
          SecurityDetails(selectedSecurity: widget.selectedSecurity),
          PurchaseSection(
            amountController: amountController,
            quantityController: quantityController,
            amountNode: amountNode,
            quantityNode: quantityNode,
            tradeType: widget.tradeType,
              selectedSecurity: widget.selectedSecurity
          ),
          TradeFeesSection(
              selectedSecurity: widget.selectedSecurity
          ),
        ],
      ),
      bottomNavigationBar: OrderPlacementSection(),
    );
  }
}
