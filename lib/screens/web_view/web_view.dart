import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final info;
  const WebViewPage({
    super.key,
    this.info,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('https://www.tokiomarine.com.br/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        // here the desired height
        child: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff02B2A3A),
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "cadastrar",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(.8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
