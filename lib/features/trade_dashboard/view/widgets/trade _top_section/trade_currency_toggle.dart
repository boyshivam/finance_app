import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class CurrencyToggle extends StatelessWidget {
  const CurrencyToggle({
    super.key,
    required this.currencyToggled,
    required this.toggled,
  });

  final void Function(bool selected) currencyToggled;
  final bool toggled;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: AppColorsCommon.appreciateThemeColor,
          ),
          borderRadius: BorderRadius.circular(20),
          color: AppColorsCommon.lightBlueBackground,
        ),
        child: GestureDetector(
          onTap: () {
            currencyToggled(!toggled);
          },
          child: AnimatedAlign(
            curve: Curves.easeIn,
            alignment: toggled ? Alignment.centerLeft : Alignment.centerRight,
            duration: Duration(milliseconds: 100),
            child: Container(
              height: 38.5,
              width: 33.5,
              decoration: BoxDecoration(
                color: AppColorsCommon.appWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black45,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 3))
                ],
              ),
              child: Center(child: toggled ? Text("₹", style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                  color: AppColorsCommon.appreciateThemeColor,
                  fontWeight: FontWeight.w600
              ),) : Text("\$", style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                  color: AppColorsCommon.appreciateThemeColor,
                  fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),);
    }
}
