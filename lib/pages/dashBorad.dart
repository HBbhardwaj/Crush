import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';



class Dashboard extends StatefulWidget {
  String _url;
  //FlutterWaveWebView(this._url, {Key? key}) : super(key: key);
  Dashboard(this._url, {Key? key}) : super(key: key);

  @override
  //_FundWalletState createState() => _FundWalletState(this._url);
  _DashboardState createState() => _DashboardState(this._url);
}

class _DashboardState extends State<Dashboard> {
  bool _isVisible = true;

  bool isLoading = false;

  String _url = "";

  _DashboardState(this._url);

  @override
  void initState() {
    super.initState();
    print(_url);
    // showAlertDialog(context);

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
   
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
          child: Stack(
            children: [
              WebView(
                initialUrl: _url,
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (url) {
                  setState(() {
                    _isVisible = false;
                  });
                },
                // navigationDelegate: (NavigationRequest request) {
                //   print(request.url);
        
                //   if (request.url.toString().contains("suceess")) {
                //     print(request.url);
                //     Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(
                //         builder: (BuildContext context) => const Dashboard(),
                //       ),
                //       (route) => false,
                //     );
        
                //     return NavigationDecision.prevent;
                //   }
                //   if (request.url.toString().contains("Invoicepaid")) {
                //     print(request.url);
                //     Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(
                //         builder: (BuildContext context) => const InvoicePaymentSuccess(),
                //       ),
                //       (route) => false,
                //     );
        
                //     return NavigationDecision.prevent;
                //   }
                //   if (request.url.toString().contains("close")) {
                //     print(request.url);
                //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                //       builder: (context) => const InvoicePaymentSuccess(),
                //     ));
                //     return NavigationDecision.prevent;
                //   }
                //   print(request.url);
                //   return NavigationDecision.navigate;
                // },
        
                // navigationDelegate: ,
              ),
              Visibility(
                visible: _isVisible,
                child: Container(
                    child: Center(
                        child: AlertDialog(
                  content: Container(
                      height: 40,
                      width: 40,
                      color: Colors.transparent,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      )),
                ))),
              ),
            ],
          ),
        );
      }));
}
