import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderPlacedButton extends StatelessWidget {
  const OrderPlacedButton({
    super.key,
    required this.text,
    required this.routeString,
  });

  final String text;
  final String routeString;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(routeString);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            color: AppColorsCommon.appreciateThemeColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColorsCommon.appWhite,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
