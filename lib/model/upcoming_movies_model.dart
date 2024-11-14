import 'dart:convert';

class UpComingMoviesModel {
  final Dates dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  UpComingMoviesModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpComingMoviesModel.fromJson(Map<String, dynamic> json) {
    return UpComingMoviesModel(
      dates: Dates.fromJson(json['dates']),
      page: json['page'],
      results: List<Movie>.from(json['results'].map((x) => Movie.fromJson(x))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Dates {
  final String maximum;
  final String minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }
}

class Movie {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: "https://image.tmdb.org/t/p/w500${json['poster_path'] ?? ''}",
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
