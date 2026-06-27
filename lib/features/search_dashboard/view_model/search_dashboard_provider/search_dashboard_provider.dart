import 'package:aprreciate/features/search_dashboard/view_model/search_dashboard_notifier/search_dashboard_notifier.dart';
import 'package:aprreciate/features/search_dashboard/view_model/search_state/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchDashboardProvider =
    NotifierProvider<SearchDashboardNotifier, SearchDashboardState>(
      SearchDashboardNotifier.new,
    );
