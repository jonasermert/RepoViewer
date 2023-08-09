import 'package:dio/dio.dart';
import '../../../../core/infrastracture/remote_response.dart';
import '../../../core/infrastracture/github_headers_cache.dart';
import '../../../core/infrastracture/githup_repo_dto.dart';
import '../../../core/infrastracture/pagination_config.dart';
import '../../core/infrastracture/repos_remote_service.dart';


class SearchedReposRemoteService extends ReposRemoteService {
  SearchedReposRemoteService(
    Dio dio,
    GithubHeadersCache headersCache,
  ) : super(dio, headersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getSearchedReposPage(
    String query,
    int page,
  ) async =>
      super.getPage(
        requestUri: Uri.https(
          'api.github.com',
          '/search/repositories',
          {
            'q': query,
            'page': '$page',
            'per_page': PaginationConfig.itemsPerPage.toString(),
          },
        ),
        jsonDataSelector: (json) => json['items'] as List<dynamic>,
      );
}