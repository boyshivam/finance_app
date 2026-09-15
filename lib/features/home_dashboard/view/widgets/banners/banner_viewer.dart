import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/home_dashboard/view/widgets/banners/banner.dart";
import "package:aprreciate/models/home_dashboard_models/banners_model.dart";
import "package:flutter/material.dart";

class BannerViewer extends StatelessWidget {
  const BannerViewer({super.key, required this.banners});

  final List<BannersModel> banners;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Container(
        color: AppColorsCommon.scaffoldBackGroundColor,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: banners.length,
            itemBuilder: (context, index) => BannerApp(banner: banners[index],)
        ),
      ),
    );
  }
}