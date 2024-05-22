import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {


  const WebViewStack({super.key,});

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  late final WebViewController controller;
  var loadingPercentage = 0;
  bool _canGoBack = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://decentattire.com/'),
      );
  }

  Future<void> _handleBack(bool canPop) async {
    if (canPop == _canGoBack) {
      if(await controller.canGoBack()){
        controller.goBack();
        _canGoBack = false;
      }
      else{
        setState(() {
          _canGoBack = true;
        });
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PopScope(
          canPop: _canGoBack,
          onPopInvoked: _handleBack,
          child: WebViewWidget(
            controller: controller,
          ),
        ),
        if (loadingPercentage < 100)
          Center(
            child: SizedBox(
              width: 150,
              child: LinearProgressIndicator(
                backgroundColor: const Color.fromRGBO(48, 55, 62, 1),
                color: Colors.amber[400],
                value: loadingPercentage / 100.0,
              ),
            ),
          ),
      ],
    );
  }
}
