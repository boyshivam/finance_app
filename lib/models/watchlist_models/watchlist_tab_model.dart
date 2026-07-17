import "package:aprreciate/features/profile_dashboard/enums/order_tab_selected_enum.dart";
import "package:aprreciate/features/watchlist_dashboard/enums/watchlit_tabs_enum.dart";
import "package:flutter/material.dart";

class WatchlistTabsModel {
  const WatchlistTabsModel({
    required this.tabName,

    required this.tab

  });


  final String tabName;
  final WatchlistTabsEnum tab;
}
