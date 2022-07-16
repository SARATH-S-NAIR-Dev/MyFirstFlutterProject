import 'dart:developer';
import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:s_help/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../fitness_app/fitness_app_home_screen.dart';
import '/Screens/Login/components/background.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:s_help/constants.dart' as constants;
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

Future getUsers(var email, var pass) async {
  try {
    var url = Uri.parse(constants.url + 'login&email=$email&pass=$pass');
    log(url.toString());
    var response = await http.get(url);
    var data = jsonDecode(response.body.toString().trim());

    if (data['status']) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("name", data['sname']);
      prefs.setString("id", data['sid']);
      prefs.setString("year", data['syear']);
      return "true";
    } else {
      return "false";
    }
  } catch (e) {
    log(e.toString());
  }
}

class _BodyState extends State<Body> {
  TextEditingController eController = new TextEditingController();

  TextEditingController pController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    Size size = MediaQuery.of(context).size;
    return Background(
      key: ValueKey("value"),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              controller: eController,
            ),
            RoundedPasswordField(
              controller: pController,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                var email = eController.text;

                var pass = pController.text;

                var data = getUsers(email, pass).then((value) => {
                      if (value == "true")
                        {
                          showToast("Login Success", gravity: Toast.bottom),
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      (FitnessAppHomeScreen())))
                        }
                      else
                        {showToast("Login Failed", gravity: Toast.bottom)}
                    });
              },
              key: GlobalKey(),
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
