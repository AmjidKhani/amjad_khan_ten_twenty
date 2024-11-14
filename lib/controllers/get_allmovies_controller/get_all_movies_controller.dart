import 'dart:developer';

import 'package:amjad_khan_ten_twenty/model/upcoming_movies_model.dart';
import 'package:amjad_khan_ten_twenty/repository/services/network/repo/get_allmovies__repository/all_upcoming_movies_repository.dart';
import 'package:amjad_khan_ten_twenty/view/utils/app_toast/app_toast.dart';
import 'package:flutter/cupertino.dart';

class GetAllMoviesController with ChangeNotifier {
  bool isLoading = false;

  List<Movie> upComingMovies = [];

  changeIsLoading(bool loadingState) {
    isLoading = loadingState;
    notifyListeners();
  }

  final GetAllMoviesRepository _apiRepository = GetAllMoviesRepository();

  Future<void> getAllMovies() async {
    try {
      changeIsLoading(true);

      var response = await _apiRepository.getAllMovies();
      debugPrint(response.toString());
      if (response != null && response['results'] != null) {
        List<dynamic> results = response["results"];

        upComingMovies = results.map((movieData) {
          return Movie.fromJson(movieData);
        }).toList();

        notifyListeners();
      } else {
        AppToast.showToast(response['status_message'] ?? "Error Occurred");
        log("Response is Null");
      }
      changeIsLoading(false);
    } catch (e) {
      log("Error ==${e.toString()}");
      changeIsLoading(false);
    } finally {
      changeIsLoading(false);
    }
  }
}
