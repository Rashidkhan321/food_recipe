// create a web view of recipe

import 'dart:async';

import 'package:flutter/material.dart';
// import this
import 'package:webview_flutter/webview_flutter.dart';
class RecipeDetail extends StatefulWidget {
  String baseurl;
 RecipeDetail({Key? key, required this.baseurl}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  bool loading = true;
  final Completer<WebViewController> controller = Completer<WebViewController>();
  late String url;
  @override
  void initState() {
    if(widget.baseurl.contains('http://')){
      url = widget.baseurl.replaceAll('http://', 'https://');
    }else{
      url = widget.baseurl;
    }


    // TODO: implement initState
    super.initState();
  }

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(top: 34.0),
        child: Container(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webcontroller){

              setState(() {

                controller.complete(webcontroller);

              });
            },

          ),
        ),
      ),


    );
  }
}
