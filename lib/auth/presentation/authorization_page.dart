import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
    
    final Uri authorizationUrl;
    final void Function(Uri redirectUrl) onAuthorizationCodeRediectAttempt;

    const AuthorizationPage({Key? key, required this.authorizationUrl, required this.onAuthorizationCodeRediectAttempt,}) : super (key : key);
    
    @override
    _AuthorizationPageState createState() => _AuthorizationPageState();

}

class _AuthorizationPageState extends State<AuthorizationPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: WebView(
                    javascriptMode: JavaScriptMode.unrestricted,
                    initialUrl: widget.authorationUrl.toString(),
                ),
            ),
        );
    }
}