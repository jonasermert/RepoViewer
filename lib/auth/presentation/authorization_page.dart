import 'dart:io';

import 'package:flutter/material.dart';
import 'package:repoviewer/auth/infrastructure/github_authenticator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorizationPage extends StatefulWidget {
    
    final Uri authorizationUrl;
    final void Function(Uri redirectUrl) onAuthorizationCodeRediectAttempt;

    const AuthorizationPage({Key? key, required this.authorizationUrl, required this.onAuthorizationCodeRediectAttempt,}) : super (key : key);
    
    @override
    _AuthorizationPageState createState() => _AuthorizationPageState();

}

class _AuthorizationPageState extends State<AuthorizationPage> {

  @override
  void initState(){
    super.initState();
    if(Platform.isAndroid){
      WebView.platform = SurfaceAndroidWebView();
    }
  }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: WebView(
                    javascriptMode: JavaScriptMode.unrestricted,
                    initialUrl: widget.authorizationUrl.toString(),
                    onWebViewCreated:(controller){
                      controller.clearCache();
                      CookieManager().clearCookie();
                    },
                    navigationDelegate: (navReq) {
                      if(navReq.url.startsWith(GithubAuthenticator.redirectUrl.toString())){
                        widget.onAuthorizationCodeRediectAttempt(navReq.url);
                        return NavigationDecision.prevent;
                      }
                      return NavigationDecision.navigate;
                    }
                ),
            ),
        );
    }
}