import "package:flutter/material.dart";

class AssetImageHelper {
  static Image image(String path, {double? height, BoxFit? fit, double? width}) {
    return Image.asset(path, height: height, fit: fit, width: width);
  }
}