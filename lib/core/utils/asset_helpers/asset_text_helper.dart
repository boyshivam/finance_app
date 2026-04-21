import "package:flutter/material.dart";


class AssetTextHelper {

  static Text text(string, {fontsize, fontweight, color}) {
    return Text(string, style:TextStyle(
      fontSize: fontsize,
      fontWeight: fontweight,
      color: color
    ));
  }
}