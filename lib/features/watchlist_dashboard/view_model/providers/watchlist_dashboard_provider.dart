import 'package:aprreciate/features/watchlist_dashboard/view_model/notifiers/watchlist_dashboard_notifier.dart';
import 'package:aprreciate/features/watchlist_dashboard/view_model/states/watchlist_dashboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchlistProvider = NotifierProvider<WatchlistDashboardNotifier, WatchlistState>(
  WatchlistDashboardNotifier.new,
);
