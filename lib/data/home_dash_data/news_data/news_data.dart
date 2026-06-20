import "package:aprreciate/core/constants/app_assets/assets_home_dashboard/news_assets/news_assets.dart";
import "package:aprreciate/core/constants/app_strings/features/app_strings_homedashboard/app_strings_news.dart";
import "package:aprreciate/features/home_dashboard/enums/news_enum.dart";
import "package:aprreciate/models/home_dashboard_models/news_model.dart";

const List<NewsModel> newsData = [
  NewsModel(
    impactIcon: NewsAssets.positiveImpactIcon,
    impactText: AppStringsNews.newsPositiveImpact,
    sentiment: NewsSentiment.positive,
    newsHeader: AppStringsNews.newsHeader1,
    newsDate: AppStringsNews.newsDate1,
  ),
  NewsModel(
    impactIcon: NewsAssets.negativeImpactIcon,
    impactText: AppStringsNews.newsNegativeImpact,
    sentiment: NewsSentiment.negative,
    newsHeader: AppStringsNews.newsHeader2,
    newsDate: AppStringsNews.newsDate2,
  ),
  NewsModel(
    impactIcon: NewsAssets.neutralImpactIcon,
    impactText: AppStringsNews.newsNeutralImpact,
    sentiment: NewsSentiment.neutral,
    newsHeader: AppStringsNews.newsHeader3,
    newsDate: AppStringsNews.newsDate3,
  ),
];
