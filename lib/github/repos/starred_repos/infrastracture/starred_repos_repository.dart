import 'package:dartz/dartz.dart';
import 'package:repoviewer/github/repos/core/infrastracture/extensions.dart';
import 'package:repoviewer/github/repos/starred_repos/infrastracture/starred_repos_local_service.dart';
import 'package:repoviewer/github/repos/starred_repos/infrastracture/starred_repos_remote_service.dart';
import '../../../../core/domain/fresh.dart';
import '../../../../core/infrastracture/network_exceptions.dart';
import '../../../core/domain/github_failure.dart';
import '../../../core/domain/github_repo.dart';


class StarredReposRepository {
  final StarredReposRemoteService _remoteService;
  final StarredReposLocalService _localService;

  StarredReposRepository(
    this._remoteService,
    this._localService,
  );

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredReposPage(
      int page) async {
    try {
      final remotePageItems = await _remoteService.getStarredReposPage(page);
      return right(
        await remotePageItems.when(
          noConnection: () async => Fresh.no(
            await _localService.getPage(page).then(
                  (_) => _.toDomain(),
                ),
            isNextPageAvailable: page < await _localService.getLocalPageCount(),
          ),
          notModified: (maxPage) async => Fresh.yes(
            await _localService.getPage(page).then(
                  (_) => _.toDomain(),
                ),
            isNextPageAvailable: page < maxPage,
          ),
          withNewData: (data, maxPage) async {
            await _localService.upsertPage(data, page);
            return Fresh.yes(
              data.toDomain(),
              isNextPageAvailable: page < maxPage,
            );
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}