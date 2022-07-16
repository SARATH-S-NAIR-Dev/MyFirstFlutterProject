import 'package:flutter/material.dart';
import 'package:s_help/session_data.dart';
import 'package:s_help/user_model.dart';
import 'package:s_help/widget/appbar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:s_help/constants.dart' as constants;

class WebViewChat extends StatefulWidget {
  var id;

  WebViewChat({Key? key, required this.id}) : super(key: key);

  @override
  WebViewChatState createState() => WebViewChatState(id);
}

class WebViewChatState extends State<WebViewChat> {
  static const lid = constants.ipId;
  SessionData sessionData = SessionData.instance;
  late UserData user;

  var id;

  WebViewChatState(this.id);

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

  get url => 'http://$lid:8080/RESULT/Chat/Chat.jsp?sid=$sid&pid=$id';

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      
      appBar: buildAppBar2(context),
      body: RotatedBox(
          quarterTurns: 0,
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          )),
    );
  }
}
