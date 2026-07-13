import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/features/stock_details_screen/view/widgets/stock_details_currencytoggle.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class StockDetailsTopSection extends StatelessWidget {
  const StockDetailsTopSection({
    super.key,
    required this.currencyToggled,
    required this.toggled,
  });

  final void Function(bool input) currencyToggled;
  final bool toggled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        25,
        MediaQuery.of(context).padding.top + 16,
        25,
        20,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              context.pop();
            },
            child: Image.asset(
              AppAssetsCommon.generic_back_cta,
              width: 35,
              height: 35,
            ),
          ),
          const Spacer(),
          Text("EQUITY"),
          const Spacer(),
          StockDetailsCurrencyToggle(
            currencyToggled: currencyToggled,
            toggled: toggled,
          ),
        ],
      ),
    );
  }
}
