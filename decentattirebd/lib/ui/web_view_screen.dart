import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../src/web_view_stack.dart';


class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  bool _canPop = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
          Uri.parse('https://decentattire.com/')
      );
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Decent Attire", style: TextStyle(color: Colors.white),),
          flexibleSpace: const FlexibleSpaceBar(stretchModes: <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle
          ]),
          backgroundColor: const Color.fromRGBO(48, 55, 62, 1),

        ),
        body: Builder(builder: (BuildContext context) {
          return const WebViewStack();
        })
    );
  }
}
