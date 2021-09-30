import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class PaymentScreen extends StatefulWidget {
  static String id = "payments_screen";
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://pages.razorpay.com/pl_HJQM1qBAVSeqS2/view',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
