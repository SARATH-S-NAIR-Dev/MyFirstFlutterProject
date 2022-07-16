import 'package:flutter/material.dart';
import './splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New One",
      home: Scaffold(
        body: Center(
          child: Splash(),
        ),
      ),
    );
  }
}
