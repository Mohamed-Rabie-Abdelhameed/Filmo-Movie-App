import 'package:filmo/logic/CallAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../logic/Movie.dart';
import '../widgets/MovieItem.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  CallAPI API = CallAPI();
  List<Movie> list = [];

  recieve() async {
    List<Movie> recieved = await API.getTopMovies();
    setState(() {
      this.list = recieved;
    });
  }

  @override
  void initState() {
    recieve();
  }

  @override
  Widget build(BuildContext context) {
    if (this.list.length == 0) {
      return Center(child: SpinKitCubeGrid(color: Colors.red));
    } else {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
          ),
          itemCount: this.list.length,
          itemBuilder: (context, index) => MovieItem(movie: this.list[index]));
    }
  }
}
