import 'dart:developer';
import 'package:amjad_khan_ten_twenty/model/movie_detail_model/movie_detail_model.dart';
import 'package:amjad_khan_ten_twenty/repository/services/network/repo/get_movie_deatil_repository/get_movie_deatil_repository.dart';
import 'package:amjad_khan_ten_twenty/view/utils/app_toast/app_toast.dart';
import 'package:flutter/cupertino.dart';

class GetMoviesDetailController with ChangeNotifier {
  bool isLoading = false;
  MovieDetail? movieDetail;

  addMovieDetailData(MovieDetail data) {
    movieDetail = data;
    notifyListeners();
  }

  changeIsLoading(bool loadingState) {
    isLoading = loadingState;
    notifyListeners();
  }

  final GetMoviesDetailRepository _apiRepository = GetMoviesDetailRepository();

  Future<void> getMovieDetail(String movieID) async {
    try {
      changeIsLoading(true);

      var response = await _apiRepository.getMoviesDetail(movieID);
      debugPrint(response.toString());
      if (response != null) {
        if (response is Map<String, dynamic> &&
            response.containsKey('status_message')) {
          AppToast.showToast(response['status_message'] ?? "Error Occurred");
        } else {
          MovieDetail movieDetailData = MovieDetail.fromJson(response);
          addMovieDetailData(movieDetailData);
        }
      } else {
        AppToast.showToast("Error Occurred");
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
