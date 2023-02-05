import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo_red.jpg"),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Get Started",
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 27, 35),
                          fontSize: 20)),
                ),
              )),
        ],
      ),
    );
  }
}
