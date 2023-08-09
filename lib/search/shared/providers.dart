import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repoviewer/core/infrastracture/sembast_database.dart';
import 'package:repoviewer/search/infrastracture/search_history_repository.dart';
import '../../core/shared/providers.dart';
import '../application/search_history_notifier.dart';


final searchHistoryRepositoryProvider = Provider(
  (ref) => SearchHistoryRepository(ref.watch(sembastProvider as AlwaysAliveProviderListenable<SembastDatabase>)),
);

final searchHistoryNotifierProvider =
    StateNotifierProvider<SearchHistoryNotifier, AsyncValue<List<String>>>(
  (ref) => SearchHistoryNotifier(
    ref.watch(searchHistoryRepositoryProvider),
  ),
);