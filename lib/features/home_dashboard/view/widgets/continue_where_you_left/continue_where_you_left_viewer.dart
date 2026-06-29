import "package:aprreciate/features/home_dashboard/view/widgets/continue_where_you_left/continue_where_left_card.dart";
import "package:aprreciate/models/home_dashboard_models/continue_where_left_model.dart";
import "package:flutter/material.dart";

class ContinueWhereYouLeftViewer extends StatelessWidget {
  const ContinueWhereYouLeftViewer({super.key, required this.items});

  final List<ContinueWhereLeftModel> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Continue where you left",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25,),
          SizedBox(
            height: 110,
            // child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     separatorBuilder: (_,_) => SizedBox(width: 30,),
            //     itemCount: items.length,
            //     itemBuilder: (context, index) => ContinueWhereLeftCard(item: items[index]),),
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  ContinueWhereLeftCard(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}
