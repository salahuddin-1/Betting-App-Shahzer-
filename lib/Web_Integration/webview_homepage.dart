import 'package:flutter/material.dart';
import '../Constants/device_parameters.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewHomepage extends StatefulWidget {
  @override
  _WebViewHomepageState createState() => _WebViewHomepageState();
}

class _WebViewHomepageState extends State<WebViewHomepage> {
  WebViewController controller;

  final String homepageURL = "https://betallweek.ag/";
  String currentURL = "https://betallweek.ag/";

  bool isLoading = false;
  int progress;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
        }
        // Stay in app
        return false;
      },
      child: Scaffold(
        appBar: _appbar(),
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.reload();
          },
          child: Stack(
            children: [
              WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: homepageURL,
                onWebResourceError: (error) {
                  setState(() {
                    hasError = true;
                  });
                },
                onPageStarted: (url) {
                  setState(() {
                    currentURL = url;
                    isLoading = true;
                  });
                },
                onWebViewCreated: (controller) {
                  setState(() {
                    isLoading = true;
                  });
                  this.controller = controller;
                },
                onPageFinished: (_) {
                  setState(() {
                    isLoading = false;
                  });
                },
                onProgress: (progress) {
                  setState(() {
                    this.progress = progress;
                  });
                },
              ),
              _IsLoading(
                progress: progress,
                isLoading: isLoading,
              ),
              hasError
                  ? _HasError(
                      onPressed: () async {
                        await controller.reload();

                        setState(() {
                          hasError = false;
                        });
                      },
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        child: Image.asset('assets/images/logo.jpeg'),
      ),
      leading: currentURL == homepageURL
          ? null
          : IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () async {
                if (await controller.canGoBack()) {
                  controller.goBack();
                }
              },
            ),
    );
  }

// -------------------- EVENTS -------------------------------------------------

  _hideFooter() {
    controller.evaluateJavascript(
      "document.getElementsByTagName('footer')[0].style.display='none'",
    );
  }
}

class _IsLoading extends StatelessWidget {
  final int progress;
  final bool isLoading;

  const _IsLoading({
    @required this.isLoading,
    @required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    if (this.progress == 100 || this.progress == null || !isLoading) {
      return SizedBox.shrink();
    }
    return Container(
      color: Colors.transparent,
      height: Device.height,
      width: Device.width,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        strokeWidth: 1.4,
        color: Colors.blue,
      ),
    );
  }
}

class _HasError extends StatelessWidget {
  final Function onPressed;

  const _HasError({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      height: Device.height,
      width: Device.width,
      child: TextButton(
        child: Text(
          "Retry",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
