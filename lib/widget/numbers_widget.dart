import 'package:flutter/material.dart';
import 'package:s_help/main.dart';
import 'package:s_help/session_data.dart';
import 'package:s_help/user_model.dart';
import '/fitness_app/fitness_app_theme.dart';

class NumbersWidget extends StatefulWidget {
  @override
  State<NumbersWidget> createState() => _NumbersWidgetState();
}

class _NumbersWidgetState extends State<NumbersWidget> {
  SessionData sessionData = SessionData.instance;
  late UserData user;
  @override
  initState() {
    super.initState();
    initializeData();
  }

  void initializeData() {
    setState(() {
      user = sessionData.getUser;
    });
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, user.reg, 'Reg No'),
          buildDivider(),
          buildButton(context, user.roll, 'Roll No'),
          buildDivider(),
          buildButton(context, user.dob, 'DOB'),
        ],
      );

  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: HexColor("#A9A9A9")),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: HexColor("#A9A9A9"),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
          ],
        ),
      );
}
