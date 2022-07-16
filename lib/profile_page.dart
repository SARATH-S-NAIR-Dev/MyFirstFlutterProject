import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:s_help/session_data.dart';
import 'package:s_help/user_model.dart';
import 'package:s_help/widget/appbar_widget.dart';
import 'package:s_help/widget/button_widget.dart';
import 'package:s_help/widget/numbers_widget.dart';
import 'package:s_help/widget/profile_widget.dart';
import 'package:s_help/constants.dart' as constants;

import 'fitness_app/fitness_app_theme.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
  Widget build(BuildContext context) {
    return user != null
        ? Scaffold(
      backgroundColor: FitnessAppTheme.background,
            appBar: buildAppBar(context),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: constants.imgUrl + user.imagePath,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                buildName(user),
                const SizedBox(height: 24),
                Center(child: buildUpgradeButton()),
                const SizedBox(height: 24),
                NumbersWidget(),
                const SizedBox(height: 48),
                buildContact(user),
                const SizedBox(height: 25),
                buildAbout(user),
              ],
            ),
          )
        : Scaffold(
            body: Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: Color.fromARGB(255, 54, 3, 116), size: 150)));
  }

  Widget buildName(UserData user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Edit Profile',
        onClicked: () {},
      );

  Widget buildAbout(UserData user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Address',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 9),
            Text(
              user.address,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildContact(UserData user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 9),
            Text(
              user.contact,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
