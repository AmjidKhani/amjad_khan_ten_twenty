class ApiEndPoints {
  //BaseUrl:
  static const String baseUrl = "https://api.themoviedb.org/3/movie";

  //upcoming Movies:
  static String upcomingMovies = "$baseUrl/upcoming";

  //singleMovie  (MOVIE_ID/videos):

  static String singleMovie = "$baseUrl/";

  //movie Details (id will be provide in controller <movie-id>):
  static String movieDetails = "$baseUrl/";

  //movie Images (/<movie-id>/images):
  static String getImages = "$baseUrl/";
}
