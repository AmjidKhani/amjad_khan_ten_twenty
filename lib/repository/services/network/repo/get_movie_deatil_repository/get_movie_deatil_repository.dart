import 'package:amjad_khan_ten_twenty/repository/services/network/api_response.dart';
import 'package:amjad_khan_ten_twenty/repository/services/network/api_services.dart';
import 'package:amjad_khan_ten_twenty/view/utils/constants/api_endpoints/api_end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetMoviesDetailRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  ApiResponses responseClass = ApiResponses();

  //  Get All  movies Details:
  Future<dynamic> getMoviesDetail(String movieID) async {
    try {
      final String token = dotenv.env['AUTH_TOKEN'] ?? '';
      dynamic response = await _apiServices
          .fetchGetResponse("${ApiEndPoints.baseUrl}/$movieID", token: token);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
