import 'package:flutter/material.dart';
import '../logic/Movie.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Color getColor(bool isFavorite) {
    if (isFavorite) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  @override
  String CurrentTitle = "";
  Widget build(BuildContext context) {
    var movie = ModalRoute.of(context)?.settings.arguments as Movie;
    setState(() {
      this.CurrentTitle = movie.title;
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500" + movie.poster_path),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_outlined, size: 40),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_rounded,
                          size: 40,
                        ),
                        color: getColor(movie.isFavorite),
                        onPressed: () {
                          setState(() {
                            if (movie.isFavorite) {
                              movie.isFavorite = false;
                            } else {
                              movie.isFavorite = true;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        movie.overview,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
