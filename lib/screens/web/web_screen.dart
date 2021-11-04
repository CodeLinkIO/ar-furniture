import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ModelWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	  return WebView(
		  initialUrl: 'https://modelviewer.dev/',
		  javascriptMode: JavascriptMode.unrestricted,
		  initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
	  );
  }
}
