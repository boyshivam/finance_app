
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import "package:flutter/material.dart";

class HeaderTextHelper extends StatelessWidget {
  const HeaderTextHelper({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 30,
        color: AppColorsCommon.appWhite,
      ),
    );
  }
}
