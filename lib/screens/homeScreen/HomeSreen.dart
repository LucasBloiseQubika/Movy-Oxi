import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/homeScreen/HomePageCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/homeScreen/HomepageStates.dart';
import '../../model/HomeResponse.dart';
import '../../repository/HomePageRepository.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomePageCubit homeCubit = HomePageCubit(HomePageRepo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MoviesContent(homeCubit: homeCubit));
  }
}

class MoviesContent extends StatelessWidget {
  const MoviesContent({
    super.key,
    required this.homeCubit,
  });

  final HomePageCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit..getData(),
      child: BlocBuilder<HomePageCubit, HomepageState>(
        builder: (context, state) {
          if (state is HomepageSuccess) {
            List<Items> items = (state).homePageResponse.items!;
            return Column(
              children: [
                const Text("My Movies",
                    style:
                        TextStyle(fontSize: 13.7, fontFamily: '.SF UI Text')),
                 HorizontalMoviesView(items: items),
                  const Text("Trending Now",
                    style:
                        TextStyle(fontSize: 13.7, fontFamily: '.SF UI Text')),
                 HorizontalMoviesView(items: items),
                  const Text("Recently Added",
                    style:
                        TextStyle(fontSize: 13.7, fontFamily: '.SF UI Text')),
                 HorizontalMoviesView(items: items)
                
              ],
            );
          } else if (state is HomepageLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return const Text("Else");
          }
        },
      ),
    );
  }
}

class HorizontalMoviesView extends StatelessWidget {
  const HorizontalMoviesView({
    super.key,
    required this.items,
  });

  final List<Items> items;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200, 
      child:ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        String currentItem = items[index].posterPath!;

        return Image.network(
          "https://image.tmdb.org/t/p/w500$currentItem",
          width: 90,
          height: 180,
        );
      },
    ),);
    
  }
}
