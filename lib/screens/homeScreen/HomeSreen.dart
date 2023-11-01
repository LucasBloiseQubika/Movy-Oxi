// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/homeScreen/HomePageCubit.dart';
import 'package:flutter_application_1/utils/commonWidgets/DividedWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/homeScreen/HomepageStates.dart';
import '../../model/HomeResponse.dart';
import '../../repository/HomePageRepository.dart';
import '../../utils/commonWidgets/ShadowOverlay.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomePageCubit homeCubit = HomePageCubit(HomePageRepo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SingleChildScrollView(child: MoviesContent(homeCubit: homeCubit))  );
  }
}

class BackgroundImage extends StatelessWidget {
  final String? imagePath;
  

  const BackgroundImage({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
    Size size = view.physicalSize / view.devicePixelRatio;
    double screenWidth = size.width;
    //MediaQuery.of(context).size.height;
   //double height = size.height;

    return ShadowOverlay(
    shadowWidth: screenWidth,
    shadowHeight: 700,
      child: Image.network(
        "https://image.tmdb.org/t/p/w500$imagePath",
        width: screenWidth,
        height: 590,
        ),
    );
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
            List<Items> movieItems = (state).homePageResponse.items!;
            return Stack(children:[ 
              BackgroundImage(imagePath: movieItems[4].posterPath,),
              MoviesMain(items: movieItems),
              ]);
          } else if (state is HomepageLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class MoviesMain extends StatelessWidget {
  const MoviesMain({
    super.key,
    required this.items,
  });

  final List<Items> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35),
        Image(image: AssetImage('images/BlueLogo.png')),
        SizedBox(height: 325),
        MovieTags(),
        SizedBox(height: 105),
        IconActionRow(),
        SizedBox(height: 83),
        const Text("My Movies",
            style:
                TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                fontFamily: '.SF UI Text')),
         HorizontalMoviesView(items: items),
          const Text("Trending Now",
            style:
                TextStyle(color: Colors.white,fontSize: 18, fontFamily: '.SF UI Text')),
         HorizontalMoviesView(items: items),
          const Text("Recently Added",
            style:
                TextStyle(color: Colors.white,fontSize: 18, fontFamily: '.SF UI Text')),
         HorizontalMoviesView(items: items)
        
      ],
    );
  }
}

class IconActionRow extends StatelessWidget {
  const IconActionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: DividedWidgets(
        widget1: IconAction(text: "My Movies", asset: "images/ic_shape2.png",),
        widget2: IconAction(text: "Play", asset: "images/ic_shape1.png",),
        widget3: IconAction(text: "Info", asset: "images/ic_shape2.png",), 
        spacer: Text("")),
    );
  }
}

class IconAction extends StatelessWidget {
  final String text;
  final String asset;

  const IconAction({
    required this.text,
    required this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image(image: AssetImage(asset)),
      Text(text,
                  style:
                      TextStyle(
                        fontSize: 16, 
                        color: Colors.white,
                        fontFamily: '.SF UI Text')),

    ],);
  }
}

class MovieTags extends StatelessWidget {
  const MovieTags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.symmetric(horizontal: 39),
    child: DividedWidgets(
      widget1: Text("Kids",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: '.SF UI Text')), 
      widget2: Text("Fantasy Movie",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: '.SF UI Text')), 
      widget3: Text("Action",
                  style: TextStyle(
                  color: Colors.white,
                      fontSize: 20,
                      fontFamily: '.SF UI Text')), 
      spacer: Text("•",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: '.SF UI Text'))));
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
