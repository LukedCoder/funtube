import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      title: "FunTube",
      home: FunTube(),
    ),
  );
}

class FunTube extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Luke's Stage 2"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.school), onPressed: () {},
            ),
            Text("Funaab Home"),
          ],
        ),
        body: WebView(
            initialUrl: "https://unaab.edu.ng",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            }),
        floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton.extended(
                label: Text("Go to Youtube!"),
                icon: Icon(Icons.video_library),
                backgroundColor: Colors.red,
                onPressed: () {
                  controller.data.loadUrl("https://youtube.com");
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
