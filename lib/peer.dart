import 'package:flutter/material.dart';
import 'package:s_help/chat.dart';
import 'package:s_help/fitness_app/fitness_app_theme.dart';

import 'package:http/http.dart' as http;
import 'package:s_help/constants.dart' as constants;
import 'dart:convert';
import 'package:s_help/peer_model.dart';
import 'package:s_help/widget/appbar_widget.dart';

class PeerPage extends StatefulWidget {
  const PeerPage({Key? key}) : super(key: key);

  @override
  _PeerPageState createState() => _PeerPageState();
}

class _PeerPageState extends State<PeerPage> {
  @override
  void initState() {
    getNoti();
  }

  final myController = TextEditingController();

  List<PeerData> result = [];

  Future getNoti() async {
    var url = Uri.parse(constants.url + 'Peer');
    var response = await http.get(url);
    var data = jsonDecode(response.body) as List;
    setState(() {
      result = data.map((e) => PeerData.fromJson(e)).toList();
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar2(context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Ask ?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 9),
            TextField(
              keyboardType: TextInputType.text,
              maxLines: 3,
              controller: myController,
            ),
            const SizedBox(height: 9),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.blue,
                shape: const StadiumBorder(),
                onPrimary: Colors.white,
                primary: const Color.fromARGB(255, 71, 26, 175),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text("Submit"),
              onPressed: () {},
            ),
            const SizedBox(height: 9),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: result.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) =>InkWell(onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebViewChat(id: result[index].id),
                              ));
                        
                  }, child: Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      color: FitnessAppTheme.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topRight: const Radius.circular(68.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: FitnessAppTheme.grey.withOpacity(0.2),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 4, bottom: 8, top: 16),
                                child: Text(
                                  result[index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: -0.1,
                                      color: FitnessAppTheme.darkText),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 1, bottom: 8),
                          child: Container(
                            height: 2,
                            decoration: const BoxDecoration(
                              color: FitnessAppTheme.background,
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(4.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 8, bottom: 16),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            result[index].content,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontFamily:
                                                  FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: -0.2,
                                              color: FitnessAppTheme.darkText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
               ), ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
