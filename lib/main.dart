import 'package:filmo/screens/HomeScreen.dart';
import 'package:filmo/screens/MovieDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'screens/WelcomeScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeScreen(),
        "/home": (context) => HomeScreen(),
        "/movie": (context) => MovieDetailsScreen(),
      },
    );
  }
}
