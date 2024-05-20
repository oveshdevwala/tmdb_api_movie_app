import 'package:flutter/material.dart';
import 'package:tmbd_movie_app/features/movies/presentation/pages/movie_details_page.dart';
import 'package:tmbd_movie_app/features/movies/presentation/pages/movie_home.dart';
import 'package:tmbd_movie_app/home.dart';

class AppRoutes {
  static const String home = '/home';
  static const String movieHome = '/movieHome';
  static const String movieDetailsHome = '/movieDetailshome';
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    home: (context) =>  Home(),
    movieHome: (context) => const MovieHome(),
    movieDetailsHome: (context) => const MovieDetailsPage()
  };
}
