import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderPlacedButton extends StatelessWidget {
  const OrderPlacedButton({
    super.key,
    required this.text,
    required this.routeString,
    required this.backGroundColor,
    required this.textColor,
  });

  final String text;
  final String routeString;
  final Color backGroundColor;
  final Color textColor;

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
            color: backGroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColorsCommon.appreciateThemeColor,
              width: 2,
            ),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: textColor,
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
