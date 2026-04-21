import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:aprreciate/models/home_dashboard/continue_where_left_model.dart";
import "package:aprreciate/widgets/helper_widgets/size_config.dart";
import "package:aprreciate/widgets/module_widgets/home_dashboard_widgets/continue_where_you_left_widgets/coontinue_where_left_card.dart";
import "package:flutter/material.dart";

class ContinueWhereLeftBuilder extends StatefulWidget {
  const ContinueWhereLeftBuilder({super.key, required this.cards});

  final List<ContinueWhereLeftModel> cards;

  @override
  State<ContinueWhereLeftBuilder> createState() => _ContinueWhereLeftBuilderState();
}

class _ContinueWhereLeftBuilderState extends State<ContinueWhereLeftBuilder> {

  int currentIndex = 0;

  final PageController _pageViewController = PageController();



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height(context) * 0.1,
      child: PageView.builder(
          controller: _pageViewController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.cards.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) => ContinueWhereLeftCard(card: widget.cards[index])),
    );
  }
}
