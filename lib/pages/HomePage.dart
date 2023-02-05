import 'package:filmo/logic/CallAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../logic/Movie.dart';
import '../widgets/MovieItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CallAPI API = CallAPI();
  List<Movie> list = [];
  List<Movie> playing = [];
  List<Movie> airing = [];

  recieve() async {
    List<Movie> recieved = await API.getUpcomingMovies();
    List<Movie> recievedPlaying = await API.getNowPlayingMovies();
    setState(() {
      this.list = recieved;
      this.playing = recievedPlaying;
    });
  }

  @override
  void initState() {
    recieve();
  }

  @override
  Widget build(BuildContext context) {
    if (this.list.length == 0 || this.playing.length == 0) {
      return Center(child: SpinKitCubeGrid(color: Colors.red, size: 60.0));
    } else {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Upcoming",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 350,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this.list.length,
              itemBuilder: (context, index) => Container(
                  width: 200, child: MovieItem(movie: this.list[index])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Now Playing",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 350,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this.playing.length,
              itemBuilder: (context, index) => Container(
                  width: 200, child: MovieItem(movie: this.playing[index])),
            ),
          ),
        ],
      );
      
    }
  }
}
