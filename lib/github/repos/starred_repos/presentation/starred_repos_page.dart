import 'package:flutter/material.dart';
import 'package:repoviewer/auth/shared/providers.dart';

class StarredResposPage extends ConsumerWidget {
    const StarredResposPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context. WidgetReference ref) {
        return Scaffold (
            body: Center(child: ElevatedButton(onPressed: (){
              context.read(authNotifierProvider.notifier).signOut();
            }, 
            child: Text('Sign Out'),
            ),
            ),
        );
    }



}