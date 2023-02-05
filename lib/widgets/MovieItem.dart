import 'package:flutter/material.dart';
import '../logic/Movie.dart';

class MovieItem extends StatelessWidget {
  Movie movie = Movie(
      id: 0,
      title: "title",
      original_title: "original_title",
      overview: "",
      release_date: "release_date",
      vote_average: 0.0,
      poster_path: "poster_path",
      backdrop_path: "backdrop_path");
  MovieItem({required this.movie});

  Icon getIcon() {
    if (this.movie.vote_average >= 8.0) {
      return Icon(Icons.star, color: Colors.green);
    } else if (this.movie.vote_average >= 5.0) {
      return Icon(Icons.star, color: Colors.yellow);
    } else {
      return Icon(Icons.star, color: Colors.red);
    }
  }

  String getTitle() {
    if (this.movie.title.length > 25) {
      return this.movie.title.substring(0, 25) + "...";
    } else {
      return this.movie.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/movie", arguments: this.movie);
        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MovieDetailsScreen()))
      },
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
                "https://image.tmdb.org/t/p/w500/${this.movie.poster_path}",),
          ),
        ),
        ListTile(
          title: Text(getTitle()),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getIcon(),
              Text(this.movie.vote_average.toString(),
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        )
      ]),
    );
  }
}
