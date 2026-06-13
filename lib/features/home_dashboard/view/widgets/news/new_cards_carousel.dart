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
          padding: const EdgeInsets.symmetric(horizontal: 25,  vertical: 15),
          child: Text("News", style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(
          height: 250,
          child: PageView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) => NewsCard(card: news[index])),
        ),
      ],
    );
  }
}
