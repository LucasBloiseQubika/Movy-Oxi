

import 'package:flutter_application_1/api/ApiService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/HomeResponse.dart';
import '../../repository/HomePageRepository.dart';
import 'HomepageStates.dart';

class HomePageCubit extends Cubit<HomepageState>{

  final HomePageRepo homePageRepo;

  HomePageCubit(this.homePageRepo):super (HomepageInitial());

  void getData() async {
    emit(HomepageLoading());
    try{
    HomeResponse data = await homePageRepo.fetchDetails();
    emit(HomepageSuccess(data));
    } on ApiErrorException {
    emit(HomepageError());
    }
  }

}