import 'package:flutter/material.dart';
import 'package:s_help/session_data.dart';
import 'package:s_help/user_model.dart';
import 'package:s_help/widget/appbar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:s_help/constants.dart' as constants;

class WebViewMark extends StatefulWidget {
  var id;

  WebViewMark({Key? key, required this.id}) : super(key: key);

  @override
  WebViewMarkState createState() => WebViewMarkState(id);
}

class WebViewMarkState extends State<WebViewMark> {
  static const lid = constants.ipId;
  SessionData sessionData = SessionData.instance;
  late UserData user;

  var id;

  WebViewMarkState(this.id);

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  void initializeData() {
    setState(() {
      user = sessionData.getUser;
    });
  }

  late String sid = user.sid;

  get url => 'http://$lid:8080/RESULT/MarkView.jsp?sid=$sid&mid=$id';

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      appBar: buildAppBar3(context),
      body: RotatedBox(
          quarterTurns: 1,
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          )),
    );
  }
}
