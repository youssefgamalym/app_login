import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreenFacebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Webview'),
      ),
      body: WebView(
        initialUrl: 'https://www.facebook.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
