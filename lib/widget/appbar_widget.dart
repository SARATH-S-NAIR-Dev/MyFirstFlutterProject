import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fitness_app/fitness_app_home_screen.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = CupertinoIcons.moon_stars;

  return AppBar(
    shadowColor: Colors.black,
    leading: BackButton(
      color: Colors.grey,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FitnessAppHomeScreen(),
            ));
      },
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      IconButton(
        color: Colors.grey,
        icon: const Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}

AppBar buildAppBar2(BuildContext context) {
  const icon = CupertinoIcons.moon_stars;

  return AppBar(
    title: const Text(
      'Ask & Learn',
      style: TextStyle(
        color: Color.fromARGB(255, 173, 27, 27),
      ),
    ),
    shadowColor: Colors.black,
    leading: BackButton(
      color: Colors.grey,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FitnessAppHomeScreen(),
            ));
      },
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      IconButton(
        color: Colors.grey,
        icon: const Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}

AppBar buildAppBar3(BuildContext context) {
  const icon = CupertinoIcons.moon_stars;

  return AppBar(
    title: const Text(
      'Semester Results',
      style: TextStyle(
        color: Colors.blue,
      ),
    ),
    shadowColor: Colors.black,
    leading: BackButton(
      color: Colors.grey,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FitnessAppHomeScreen(),
            ));
      },
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      IconButton(
        color: Colors.grey,
        icon: const Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}
