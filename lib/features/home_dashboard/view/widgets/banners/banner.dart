import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/home_dashboard_models/banners_model.dart";
import "package:flutter/material.dart";

class BannerApp extends StatelessWidget {
  const BannerApp({super.key, required this.banner});

  final BannersModel banner;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColorsCommon.appreciateThemeColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      banner.bannerTitle,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColorsCommon.appWhite,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      banner.bannerSubtext,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColorsCommon.appWhite,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColorsCommon.appWhite,
                        borderRadius: BorderRadius.circular(14)
                      ),
                      child: Text(banner.buttonText, style: Theme.of(context).textTheme.bodySmall,),
                    )
                  ],
                ),
              ),
              Image.asset(banner.iconPath, width: 80, height: 80,)
            ],
          ),
        ),
      ],
    );
  }
}
