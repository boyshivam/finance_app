import 'package:aprreciate/features/watchlist_dashboard/view_model/watchlist_notifier.dart';
import 'package:aprreciate/features/watchlist_dashboard/view_model/watchlist_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchlistProvider = NotifierProvider<WatchlistNotifier, WatchlistState>(
  WatchlistNotifier.new,
);
