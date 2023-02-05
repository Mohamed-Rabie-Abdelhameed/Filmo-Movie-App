import 'dart:convert';
import 'package:http/http.dart';
import 'Movie.dart';

class CallAPI {
  Future<List<Movie>> getPopularMovies() async {
    List<Movie> list = [];
    //https://api.themoviedb.org/3/movie/popular?api_key=eb03df251074313f6e24c705f23a1cdc
    try {
      Uri link = Uri.https("api.themoviedb.org", "/3/movie/popular",
          {"api_key": "14ac2867e5e08d66156e73a00dadc05b"});
      Response response = await get(link);
      var Data = jsonDecode(response.body);
      List returnedmovies = Data["results"] as List;
      list = returnedmovies
          .map((mov) => Movie(
              id: mov["id"],
              title: mov["title"],
              original_title: mov["original_title"],
              overview: mov["overview"],
              release_date: mov["release_date"],
              vote_average: mov["vote_average"] * 1.0,
              poster_path: mov["poster_path"],
              backdrop_path: mov["backdrop_path"]))
          .toList();
      return list;
    } catch (ex) {
      print(ex);
      return list;
    }
  }

  Future<List<Movie>> getTopMovies() async {
    List<Movie> list = [];
    //https://api.themoviedb.org/3/movie/popular?api_key=eb03df251074313f6e24c705f23a1cdc
    try {
      Uri link = Uri.https("api.themoviedb.org", "/3/movie/top_rated",
          {"api_key": "14ac2867e5e08d66156e73a00dadc05b"});

      Response response = await get(link);

      var Data = jsonDecode(response.body);
      List returnedmovies = Data["results"] as List;
      list = returnedmovies
          .map((mov) => Movie(
              id: mov["id"],
              title: mov["title"],
              original_title: mov["original_title"],
              overview: mov["overview"],
              release_date: mov["release_date"],
              vote_average: mov["vote_average"] * 1.0,
              poster_path: mov["poster_path"],
              backdrop_path: mov["backdrop_path"]))
          .toList();
      return list;
    } catch (ex) {
      print(ex);
      return list;
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    List<Movie> list = [];
    try {
      Uri link = Uri.https("api.themoviedb.org", "/3/movie/upcoming",
          {"api_key": "14ac2867e5e08d66156e73a00dadc05b"});

      Response response = await get(link);
      var data = jsonDecode(response.body);
      List returnedMovies = data["results"] as List;
      list = returnedMovies
          .map((mov) => Movie(
              id: mov["id"],
              title: mov["title"],
              original_title: mov["original_title"],
              overview: mov["overview"],
              release_date: mov["release_date"],
              vote_average: mov["vote_average"] * 1.0,
              poster_path: mov["poster_path"],
              backdrop_path: mov["backdrop_path"]))
          .toList();
      return list;
    } catch (ex) {
      print(ex);
      return list;
    }
  }


  Future<List<Movie>> getNowPlayingMovies() async {
    List<Movie> list = [];

    try {
      Uri link = Uri.https("api.themoviedb.org", "/3/movie/now_playing",
          {"api_key": "14ac2867e5e08d66156e73a00dadc05b"});

      Response response = await get(link);
      var data = jsonDecode(response.body);
      List returnedMovies = data["results"] as List;
      list = returnedMovies
          .map((mov) => Movie(
              id: mov["id"],
              title: mov["title"],
              original_title: mov["original_title"],
              overview: mov["overview"],
              release_date: mov["release_date"],
              vote_average: mov["vote_average"] * 1.0,
              poster_path: mov["poster_path"],
              backdrop_path: mov["backdrop_path"]))
          .toList();
      return list;
    } catch (ex) {
      print(ex);
      return list;
    }
  }
  
}
