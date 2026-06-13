import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/home_dashboard/view/widgets/news/news_card.dart";
import "package:aprreciate/models/home_dashboard/news_model.dart";
import "package:flutter/material.dart";

class NewsCarousel extends StatelessWidget {
  const NewsCarousel({super.key, required this.news});

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 25
          ),
          child: Row(
            children: [
              Text("News", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold
              ),),
              const Spacer(),
              Text(AppStringsCommon.genericViewAllText, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColorsCommon.appreciateThemeColor,
                fontWeight: FontWeight.w300
              ) ,)
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: PageView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) => NewsCard(card: news[index])),
        ),
      ],
    );
  }
}
