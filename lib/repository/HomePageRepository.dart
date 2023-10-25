import 'dart:convert';

import 'package:flutter_application_1/api/ApiService.dart';
import 'package:http/http.dart';

import '../model/HomePageModel.dart';
import 'package:http/http.dart' as http;

import '../model/HomeResponse.dart';

abstract class HomePageRepository {
  Future<HomeResponse> fetchDetails();
}

class HomePageRepo extends HomePageRepository {

  @override
  Future<HomeResponse> fetchDetails() async {
    HomeResponse result = HomeResponse();

    await ApiService.getService("3/list/1", (onSuccessResponse) {
      result = HomeResponse.fromJson(json.decode(onSuccessResponse.body));
    }, (onErrorResponse) {
      onErrorResponse.body;
    });

    return result;
  }
}
