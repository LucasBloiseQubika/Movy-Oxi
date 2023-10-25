

import 'package:http/http.dart';

import '../model/HomeResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ApiService {
  

  static Future<void> getService(String path,Function(Response) onSuccess, Function(Response) onFailure) async {
  final queryParameters = {
      'api_key': '044710246cdf9de85f92f39a550e2d23'
    };

    final uri = Uri.https('api.themoviedb.org', path,queryParameters);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      onSuccess(response);
    } else {
      onFailure(response);
    }

  }

}

abstract class ApiResult {}

class ApiResponse extends ApiResult {}

class ApiError extends ApiResult {}