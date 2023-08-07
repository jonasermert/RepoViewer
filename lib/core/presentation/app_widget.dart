import 'package:flutter/material.dart';
import 'package:repoviewer/splash/presentation/splash_page.dart';

class AppWiget extends StatelessWidget {
    final AppRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RepoViewer',
      routerDelegate: appRouter.delegate() ,
      routeInformationParser: appRouter.defaultRouterParser(),
    
    );
  }
}