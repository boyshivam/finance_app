import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class OrderTypeTagHelper extends StatelessWidget {
  const OrderTypeTagHelper({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w700
    });

  final String text;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
