

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/HomeResponse.dart';
import '../repository/HomePageRepository.dart';
import 'HomePageBloc.dart';

class HomePageCubit extends Cubit<HomepageState>{

  final HomePageRepo homePageRepo;

  HomePageCubit(this.homePageRepo):super (HomepageInitial());


  void getData() async {
    
   HomeResponse data = await homePageRepo.fetchDetails();

    emit( HomepageSuccess(data));
  }



}