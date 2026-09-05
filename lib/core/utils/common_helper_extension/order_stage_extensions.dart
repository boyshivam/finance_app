import 'package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart';
import "package:flutter/material.dart";

extension OrderStageExtension on OrderStageEnums {
  // error text for each stage of error
  String get errorText {
    switch (this) {
      case OrderStageEnums.submitted:
        return "SUBMITTED";

      case OrderStageEnums.processing:
        return "PROCESSING";

      case OrderStageEnums.successful:
        return "SUCCESSFUL";

      case OrderStageEnums.failed:
        return "FAILED";

      case OrderStageEnums.cancelled:
        return "CANCELLED";
    }
  }

  Color get errorTextColor {
    switch (this) {
      case OrderStageEnums.submitted:
        return Color(0xFF8c8804);

      case OrderStageEnums.processing:
        return Color(0xFFf78131);

      case OrderStageEnums.successful:
        return Color(0xFF09ab24);

      case OrderStageEnums.failed:
        return Color(0xFFa11705);

      case OrderStageEnums.cancelled:
        return Color(0xFFa11705);
    }
  }

  Color get errorBgColor {
    switch (this) {
      case OrderStageEnums.submitted:
        return Color(0xFFf7f5ba);
      //

      case OrderStageEnums.processing:
        return Color(0xFFf5ae7f);

      case OrderStageEnums.successful:
        return Color(0xFF71f086);

      case OrderStageEnums.failed:
        return Color(0xFFf56856);

      case OrderStageEnums.cancelled:
        return Color(0xFFf56856);
    }
  }
}
