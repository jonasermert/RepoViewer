import 'package:dartz/dartz.dart';
import 'package:repoviewer/github/repos/core/infrastracture/extensions.dart';
import 'package:repoviewer/github/repos/searched_repos/infrastracture/searched_repos_remote_service.dart';
import '../../../../core/domain/fresh.dart';
import '../../../../core/infrastracture/network_exceptions.dart';
import '../../../core/domain/github_failure.dart';
import '../../../core/domain/github_repo.dart';


class SearchedReposRepository {
  final SearchedReposRemoteService _remoteService;

  SearchedReposRepository(this._remoteService);

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getSearchedReposPage(
    String query,
    int page,
  ) async {
    try {
      final remotePageItems =
          await _remoteService.getSearchedReposPage(query, page);
      return right(
        remotePageItems.maybeWhen(
          withNewData: (data, maxPage) => Fresh.yes(
            data.toDomain(),
            isNextPageAvailable: page < maxPage,
          ),
          orElse: () => Fresh.no([], isNextPageAvailable: false),
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}