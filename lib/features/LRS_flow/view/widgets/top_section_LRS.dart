import 'dart:math';

import 'package:aprreciate/core/constants/app_assets/app_assets_common.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:flutter/material.dart';

class TopSectionLrs extends StatelessWidget {
  const TopSectionLrs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, MediaQuery.of(context).padding.top + 16, 25, 25),
      decoration: BoxDecoration(color: AppColorsCommon.appWhite),
      child: Row(
        children: [
          Image.asset(
            AppAssetsCommon.generic_back_cta,
            width: 30,
            height: 30,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Transfer to US wallet",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
