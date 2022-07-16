import 'dart:developer';

import 'package:s_help/fitness_app/my_diary/my_notification.dart';
import 'package:s_help/fitness_app/my_diary/nnotification.dart';
import 'package:s_help/profile_page.dart';
import 'package:s_help/session_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:s_help/constants.dart' as constants;
import 'dart:convert';
import 'package:s_help/user_model.dart';
import '/fitness_app/models/tabIcon_data.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'fitness_app_theme.dart';
import 'my_diary/my_diary_screen.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  const FitnessAppHomeScreen({Key? key}) : super(key: key);

  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  UserData? user;
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  initialData() async {
    UserData temp = await getUsers();
    SessionData sessionData = SessionData.instance;
    sessionData.setUserData(temp);

    setState(() {
      user = temp;
    });
  }

  @override
  void initState() {
    initialData();
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      NNotification(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      MyNotification(animationController: animationController);
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = ProfilePage();
                });
              });
            }
          },
        ),
      ],
    );
  }
}

Future<UserData> getUsers() async {
  final prefs = await SharedPreferences.getInstance();
  var studid = prefs.getString('id');
  var url = Uri.parse(constants.url + 'Profile&StudentId=$studid');
  var response = await http.get(url);
  var data = jsonDecode(response.body.toString().trim());
  //log(data.toString());
  return UserData(
    imagePath: data['sprofile'],
    sid: data['sid'],
    name: data['sname'],
    email: data['semail'],
    about: data['sreg'],
    address: data['saddress'],
    isDarkMode: false,
    contact: data['scontact'],
    dob: data['sdob'],
    roll: data['sroll'],
    reg: data['sreg'],
  );
}
