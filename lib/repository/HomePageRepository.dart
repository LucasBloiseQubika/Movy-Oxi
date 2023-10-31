import 'dart:convert';

import 'package:flutter_application_1/api/ApiService.dart';


import '../model/HomeResponse.dart';

abstract class HomePageRepository {
  Future<HomeResponse> fetchDetails();
}

class HomePageRepo extends HomePageRepository {

  @override
  Future<HomeResponse> fetchDetails() async {
    HomeResponse result = HomeResponse();

    await ApiService.getService("3/list/1", 
    (onSuccessResponse) {
      result = HomeResponse.fromJson(json.decode(onSuccessResponse.response.body));
    }, (onErrorResponse) {
        throw ApiErrorException(onErrorResponse.response.body);
    });

    return result;
  }
}

