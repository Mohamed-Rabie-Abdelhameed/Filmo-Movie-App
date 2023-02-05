import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            title: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "App"),
                Tab(icon: Icon(Icons.account_box), text: "Account"),
                Tab(icon: Icon(Icons.description_rounded), text: "About"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("App")),
              Center(child: Text("Account")),
              Column(
                children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "This App was created by: Mohamed Rabie\n\nEmail: mohamed.rabie.abdelhameed@gmail.com\n\nGithub: https://github.com/Mohamed-Rabie-Abdelhameed",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ],
          ),
        ));
  }
}
