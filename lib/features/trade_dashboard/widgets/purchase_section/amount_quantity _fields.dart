import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class FractionAmountQuantityFields extends StatelessWidget {
  const FractionAmountQuantityFields({
    super.key,
    required this.toggledINR,
    required this.amountController,
    required this.quantityController,
    required this.quantityPurchasedByAmount,
    required this.amountEnteredByQuantity
  });

  final TextEditingController amountController;
  final TextEditingController quantityController;
  final void Function() quantityPurchasedByAmount;
  final void Function() amountEnteredByQuantity;
  final bool toggledINR;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            TextField(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                prefix: toggledINR
                    ? Text(
                        "₹ ",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text("\$ ",  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),),
                hint: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Amount",),
                ),
                border: InputBorder.none,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.inactiveTextFieldBorderColor,
                    width: 2,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.appreciateThemeColor,
                    width: 2,
                  ),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.negativeRed,
                    width: 2,
                  ),
                ),
              ),

              onChanged: (_){
                quantityPurchasedByAmount();
              },

            ),
            const SizedBox(height: 20),
            TextField(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold),
              controller: quantityController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                prefix: Text("    "),
                hint: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Qty"),
                ),

                border: InputBorder.none,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.inactiveTextFieldBorderColor,
                    width: 2,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.appreciateThemeColor,
                    width: 2,
                  ),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: AppColorsCommon.negativeRed,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (_) {
                amountEnteredByQuantity();
              },
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Center(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColorsCommon.appWhite,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 7, spreadRadius: 2),
                ],
              ),

              child: Column(
                children: [
                  Icon(Icons.keyboard_arrow_up_outlined, size: 20),
                  Icon(Icons.keyboard_arrow_down_outlined, size: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
