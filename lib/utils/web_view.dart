import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget{
  const WebView({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  final String title;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Stack(
        children: [
          const Center(child: CircularProgressIndicator()),
          WebViewWidget(controller: controller.webViewController),
        ],
      ),
    );
  }

}