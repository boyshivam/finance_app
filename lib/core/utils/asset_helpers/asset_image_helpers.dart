import "package:flutter/material.dart";


class AssetImageHelper {

  static Image image(String path, {double? width, double? height, BoxFit? fit}){
    return Image.asset(path, height: height, width: width, fit: fit );
  }

}