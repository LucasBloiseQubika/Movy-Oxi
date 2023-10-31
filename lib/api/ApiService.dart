

import 'package:http/http.dart';

import 'package:http/http.dart' as http;



class ApiService {
  

  static Future<void> getService(String path,Function(ApiResponse) onSuccess, Function(ApiError) onFailure) async {
  final queryParameters = {
      'api_key': '044710246cdf9de85f92f39a550e2d23'
    };

    final uri = Uri.https('api.themoviedb.org', path,queryParameters);

    final response = await http.get(uri);

    ApiResult result;

    if (response.statusCode == 200) {
      result = ApiResponse(response: response);
      onSuccess(result as ApiResponse);
    } else {
      result = ApiError(response: response);
      onFailure(result as ApiError);
    }

  }

}

abstract class ApiResult {
  final Response response;

  ApiResult({required this.response});
}

class ApiResponse extends ApiResult {
  ApiResponse({required super.response});
}

class ApiError extends ApiResult {
  ApiError({required super.response});
}

class ApiErrorException implements Exception {
  String cause;
  ApiErrorException(this.cause);
}