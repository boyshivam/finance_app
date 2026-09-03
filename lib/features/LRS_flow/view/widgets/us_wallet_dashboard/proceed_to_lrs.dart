import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class ProceedToLrsCTA extends StatelessWidget {
  const ProceedToLrsCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: InkWell(
        onTap: (){
          context.push(AppRoutes.lrsTransferScreen);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColorsCommon.appreciateThemeColor,
          ),
          child: Text(
            "Add funds",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColorsCommon.appWhite,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
