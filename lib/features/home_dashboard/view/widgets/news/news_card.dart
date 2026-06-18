import "package:aprreciate/core/constants/app_assets/home_dashboard/news_assets/news_assets.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/home_dashboard/view/extensions/news_sentiment_extension.dart";
import "package:aprreciate/models/home_dashboard_models/news_model.dart";
import "package:flutter/material.dart";

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.card});

  final NewsModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
        color: AppColorsCommon.appWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(card.impactIcon, width: 25, height: 25),
              const SizedBox(width: 10),
              Text(card.impactText, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: card.sentiment.sentimentColor
              ),),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            card.newsHeader,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(card.newsDate, style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w300
              ),),
              const Spacer(),
              Image.asset(NewsAssets.forwardCtaIcon, width: 40, height: 25),
            ],
          ),
        ],
      ),
    );
  }
}
