import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:s_help/constants.dart' as constants;

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  static const id = constants.ipId;
  var year;

  @override
  void initState() {
    super.initState();
    readData();
  }

  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() => year = prefs.getString('year') ?? "2000");
  }

  get url => 'http://$id:8080/RESULT/timetable.jsp?year=' + year;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 1,
        child: WebView(
          initialUrl: url,
        ));
  }
}
