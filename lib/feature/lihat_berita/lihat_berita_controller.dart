import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/data/remote/api_service.dart';
import 'package:flutter_ujikom_test_2/data/remote/base/base_controller.dart';
import 'package:flutter_ujikom_test_2/model/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LihatBeritaController extends BaseController{

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getDataNews();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  @override
  // TODO: implement statusData
  get statusData => throw UnimplementedError();

  @override
  // TODO: implement storageName
  String get storageName => throw UnimplementedError();

  List<News> dataArray = [];
  
  WebViewController webViewController = WebViewController();
  bool loadingPage = false;

  Future<void> getDataNews()async{
    await changeStatusLoading();
    List<News> data = await APIService().getNews();
    await changeStatusLoading();
    dataArray = data;
    update();
  }

  Future<void> changeStatusLoading() async{
    if (loadingPage) {
      loadingPage = false;
    } else {
      loadingPage = true;
    }
    update();
  }

  

  void createWebView(String urlWebView) {
    webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(urlWebView));
    update();
  }

}