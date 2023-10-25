import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/HomePageCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/HomePageBloc.dart';
import '../../model/HomeResponse.dart';
import '../../repository/HomePageRepository.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomePageCubit homeCubit = HomePageCubit(HomePageRepo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context)  => homeCubit..getData(),
        child: BlocBuilder<HomePageCubit, HomepageState>(
          builder: (context, state) {
            if (state is HomepageSuccess) {
              List<Items> items =
                  (state as HomepageSuccess).homePageResponse.items!;
              return ListView.builder(
                itemCount: items!.length,
                itemBuilder: (BuildContext context, int index) {

                  String currentItem = items[index].posterPath!;

                  return Image.network("https://image.tmdb.org/t/p/w500$currentItem", width: 300,height: 300,);
                },
              );
            } else {
              return GestureDetector(
                child: Text("PEPE"),
                onTap: () {
                  homeCubit.getData();
                },
              );
            }
          },
        ),
      ),
    );
  }
}
