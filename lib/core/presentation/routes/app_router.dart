import 'package:auto_route/auto_route.dart';
import 'package:repoviewer/auth/presentation/sign_in_pge.dart';
import 'package:repoviewer/splash/presentation/splash_page.dart';
import 'package:repoviewer/starred_repos/presentation/starred_repos.page.dart';

@MaterialAutoRouter(routes:[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage, path: '/sign-in'),
    MaterialRoute(page: StarredResposPage, path: '/starred'),
],
replaceInRouteName: 'Page,Route',
)
class $AppRouter{

}