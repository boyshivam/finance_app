import 'package:aprreciate/features/watchlist_dashboard/enums/watchlit_tabs_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/view/widgets/create_watchlist_bottomsheet.dart';
import 'package:aprreciate/features/watchlist_dashboard/view_model/watchlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatchlistNotifier extends Notifier<WatchlistState> {
  @override
  WatchlistState build() {
    return WatchlistState(selectedTab: WatchlistTabsEnum.usStocks);
  }


  // change the watchlist tab
  void changeTab(WatchlistTabsEnum selectedTab){
    state = state.copyWith(
      selectedTab: selectedTab
    );
  }

  // open create watchlist bottom sheet on clicking on create
  void createWatchlistBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context){
      return CreateWatchlistBottomSheet();
    });
  }

}
