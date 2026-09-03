import 'dart:math';

import 'package:aprreciate/core/constants/app_assets/app_assets_common.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/router/app_navigators.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class TopSectionLrs extends StatelessWidget {
  const TopSectionLrs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        25,
        MediaQuery.of(context).padding.top + 20,
        25,
        35,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColorsCommon.appreciateThemeColor,
            AppColorsCommon.snackBarMsgBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Text(
            "Transfer to Us wallet",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: AppColorsCommon.appWhite
            ),
          ),
          const Spacer(),
          Icon(Icons.support_agent_outlined, size: 30, color: AppColorsCommon.appWhite,)
        ],
      ),
    );
  }
}
