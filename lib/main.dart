import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homeScreen/HomeSreen.dart';
import 'package:flutter_application_1/screens/planSelection/planSelectionScreenRoute.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/HomePageBloc.dart';
import 'repository/HomePageRepository.dart';

void main() {
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: const Scaffold(
          body: SafeArea(
            child: HomeScreen(),
          ),
        ),
    );
  }
}

final ThemeData myTheme = ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme(
      primary: Color(0xff0578FF),
      background: Color(0xff0578FF),
      brightness: Brightness.light,
      onPrimary: Colors.white,
      secondary: Colors.white,
      error: Colors.red,
      onSecondary: Colors.white,
      onError: Colors.red,
      onBackground: Colors.white,
      surface: Colors.white,
      onSurface: Colors.white,
    ));
