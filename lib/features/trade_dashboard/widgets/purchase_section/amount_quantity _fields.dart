import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class FractionAmountQuantityFields extends StatelessWidget {
  const FractionAmountQuantityFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            TextField(
              
              decoration: InputDecoration(
                suffix: Text("Amount"),
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
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                suffix: Text("Qty"),
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
