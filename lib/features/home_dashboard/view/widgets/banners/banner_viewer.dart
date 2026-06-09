import "package:aprreciate/models/home_dashboard/banners_model.dart";
import "package:flutter/material.dart";

class BannerViewer extends StatelessWidget {
  const BannerViewer({super.key, required this.banners});

  final List<BannersModel> banners;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) => Banner());
  }
}