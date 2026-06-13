
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import "package:flutter/material.dart";
import 'package:aprreciate/features/home_dashboard/enums/news_enum.dart';

extension NewsSentimentExtension on NewsSentiment {

  Color get sentimentColor {

    switch(this) {

      case NewsSentiment.positive:
        return AppColorsCommon.positiveGreen;

      case NewsSentiment.negative:
        return AppColorsCommon.negativeRed;

      case NewsSentiment.neutral:
        return AppColorsCommon.appreciateThemeColor;

    }

  }

}