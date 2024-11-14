import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_exceptions.dart';

class ApiResponses {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        // throw BadRequestException(response.body.toString());
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        // dynamic responseJson = jsonDecode(response.body);
        //UserPreferences.logout();
        //navigatorKey.currentState?.pushReplacementNamed(RoutesName.signinPage);
        return;
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 406:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 409:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 422:
        throw UnauthorisedException(response.body.toString());

      case 500:
        // throw UnauthorisedException(response.body.toString());
        return jsonDecode('{"response": "Internal Server Error"}');
      default:
        throw FetchDataException(
            "Error occured while communicating with server with status code ${response.statusCode}");
    }
  }
}
