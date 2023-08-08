import 'package:flutter/material.dart';

class SignInPage extends ConsumerWidget {
    const SignInPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context, WidgetReference ref) {
        return Scaffold (
            body: SafeArea(
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            const Icon(
                                MdiIcons.github,
                                size 150,
                            ),
                            const SizedBox(height: 16)
                            Text('Welcome to Repo Viewer', style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.center
                            ),
                            const SizeBox(height: 32),
                            ElevatedButton(onPressed: () {
                                context.read(authNotifierProvider.notifier).signIn(authorizationUrl) {
                                    final completer = Completer<Uri>();
                                    AutoRouter.of(context.push(AuthorizationRoute(
                                        authorizationUrl: authorizationUrl, onAuthorizationCodeRediectAttempt: (redirectUrl){
                                            completer.complete(redirectUrl);
                                        },
                                    ),
                                    );
                                    return completer.future;
                                });
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.green),
                            ),
                            child: text('Sign In'),
                            ),
                        ]
                    )
                    )
                    )
                )
            )
            
        );
    }



}