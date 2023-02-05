import 'package:flutter/material.dart';

import '../pages/HomePage.dart';
import '../pages/Settings.dart';
import '../pages/TopRated.dart';
import '../pages/Popular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    Popular(),
    TopRated(),
    Settings(),
  ];
  List<String> titles = ["Home", "Popular", "Top Rated", "Settings"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(this.titles[this.currentIndex]),
      ),
      body: SafeArea(child: this.pages[this.currentIndex]),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: this.currentIndex,
        onTap: (index) {
          setState(() {
            this.currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Color.fromARGB(255, 228, 27, 35)),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart_sharp),
              label: "Popular",
              backgroundColor: Color.fromARGB(255, 228, 27, 35)),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Top Rated",
              backgroundColor: Color.fromARGB(255, 228, 27, 35)),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Color.fromARGB(255, 228, 27, 35)),
        ],
      ),
    );
  }
}
