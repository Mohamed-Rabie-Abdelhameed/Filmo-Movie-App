class Movie {
  String poster_path;
  String overview;
  String release_date;
  int id;
  String original_title;
  String title;
  String ?backdrop_path;
  double vote_average;
  bool isFavorite = false;

  Movie({
    required this.id,
    required this.title,
    required this.original_title,
    required this.overview,
    required this.release_date,
    required this.vote_average,
    required this.poster_path,
    required this.backdrop_path,
  });
}
