import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/HomeResponse.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class HomepageLoading extends HomepageState {}

class HomepageSuccess extends HomepageState {
  final HomeResponse homePageResponse;

  HomepageSuccess(this.homePageResponse);
}

class HomepageError extends HomepageState {}