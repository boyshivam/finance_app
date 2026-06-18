

import 'package:aprreciate/features/home_dashboard/enums/news_enum.dart';

class NewsModel {
  const NewsModel({
    required this.impactIcon,
    required this.sentiment,
    required this.impactText,
    required this.newsHeader,
    required this.newsDate,

});
  final String impactIcon;
  final NewsSentiment sentiment;
  final String impactText;
  final String newsHeader;
  final String newsDate;

}