// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:s_help/fitness_app/fitness_app_home_screen.dart';
import 'package:s_help/profile_page.dart';

import 'Screens/Login/login_screen.dart';

class GridDashboard extends StatefulWidget {
  const GridDashboard({Key? key}) : super(key: key);

  @override
  State<GridDashboard> createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  Items item1 = new Items(
    title: "View Profile",
    subtitle: "View your profile here",
    event: "",
    img: "assets/profile.png",
  );

  Items item2 = new Items(
    title: "Timetable",
    subtitle: "View Timetable here",
    event: "",
    img: "assets/time.png",
  );

  Items item3 = new Items(
    title: "Peer Learning",
    subtitle: "Ask questions here",
    event: "",
    img: "assets/map.png",
  );

  Items item4 = new Items(
    title: "Semester Results",
    subtitle: "View sem results here",
    event: "",
    img: "assets/res.png",
  );

  Items item5 = new Items(
    title: "Calendar",
    subtitle: "Academic Calendar",
    event: "",
    img: "assets/calendar.png",
  );

  Items item6 = new Items(
    title: "Settings",
    subtitle: "Basic settings",
    event: "",
    img: "assets/set.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var widgets = List.generate(3, (index) => Text('I am $index'));
    var color = 0xDF0E1795;
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.amber,
          title: const Text('MCA DEPT'),
          foregroundColor: Color.fromARGB(255, 15, 33, 125),
          backgroundColor: Color.fromARGB(255, 246, 246, 248),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('You pressed bell icon.'),
                ));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Flexible(
              child: GridView.count(
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, bottom: 50, top: 50),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: myList.map((data) {
                    return InkWell(
                      onTap: () {
                        if (data.title == "View Profile") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ));
                        }
                        if (data.title == "Settings") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FitnessAppHomeScreen(),
                              ));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(color),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              data.img,
                              width: 42,
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              data.title,
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.subtitle,
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(231, 243, 244, 244),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Text(
                              data.event,
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList()),
            ),
          ],
        ));
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}
