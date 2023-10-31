

// import 'package:flutter/widgets.dart';
// import 'package:flutter_application_1/model/HomeResponse.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../repository/HomePageRepository.dart';

// class HomePageBloc extends Bloc<HomepageEvent, HomepageState> {

//   final HomePageRepo homePageRepo;

//   HomePageBloc(this.homePageRepo) : super(HomepageInitial()) {
//         print("object");
//         on<GetDataEvent>((event, emit) async {
//         print("object");

//         var data = await homePageRepo.fetchDetails();
//         emit(HomepageError());
//         });

//   }

// }

// @immutable
// abstract class HomepageEvent {}

// class GetDataEvent extends HomepageEvent {}

// @immutable
// abstract class HomepageState {}

// class HomepageInitial extends HomepageState {}

// class HomepageLoading extends HomepageState {}

// class HomepageSuccess extends HomepageState {
//   final HomeResponse homePageResponse;

//   HomepageSuccess(this.homePageResponse);
// }

// class HomepageError extends HomepageState {}
