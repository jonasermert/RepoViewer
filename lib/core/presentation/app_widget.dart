import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repoviwer/auth/shared/providers.dart';
import 'package:repoviewer/splash/presentation/splash_page.dart';
import 'package:repoviewer/core/presentation/routes/app_router.gr.dart';

final initializationProvider = FutureProvider<Unit>((ref) asnyc {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    await authNotifier.checkAndUpdateAuthStatus();
    return unit;
});

class AppWiget extends StatelessWidget {
    final AppRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
        provider: initializationProvider,
        onChange: (context, value) {},
        child: ProviderListener<AuthState>(
          provider:authNotifierProvider,
          onChange: (context, state) {
            state.maybeMap(orElse: () {},
            authenticated(_){
              // AutoRouter.of(context)
              appRouter.pushAndPopUntil(const StarredReposRoute(), predicate: (route) => false, 
              );
            },
            unauthenticated: (_) {
              appRouter.pushAndPopUntil(
                const SignInRoute();
                predicate: (route) => false,
              );
            }
            );
          },
        )
        child: MaterialApp.router(
        title: 'RepoViewer',
        routerDelegate: appRouter.delegate() ,
        routeInformationParser: appRouter.defaultRouterParser(),
        
        ),
    );
  }
}