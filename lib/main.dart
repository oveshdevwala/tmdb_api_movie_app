import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tmbd_movie_app/core/constant/app_routes/app_routes.dart';
import 'package:tmbd_movie_app/core/theme/home_theme.dart';
import 'package:tmbd_movie_app/features/home_provider.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_details_by_id_bloc/movie_details_by_id_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_review_bloc/movie_review_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_videos_bloc/movie_video_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/now_movies_bloc/now_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/similar_movies_bloc/similar_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/top_rate_movies_bloc/top_rated_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/upcoming_movies_bloc/upcoming_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/providers/slider_provider.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/providers/video_id_provider.dart';
import 'package:tmbd_movie_app/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => NowMoviesBloc(sl())),
      BlocProvider(create: (context) => PopularMoviesBloc(sl())),
      BlocProvider(create: (context) => UpcomingMoviesBloc(sl())),
      BlocProvider(create: (context) => TopRatedMoviesBloc(sl())),
      BlocProvider(create: (context) => MovieDetailsByIdBloc(sl())),
      BlocProvider(create: (context) => SimilarMoviesBloc(sl())),
      BlocProvider(create: (context) => MovieReviewBloc(sl())),
      BlocProvider(create: (context) => MovieVideoBloc(sl())),
    ],
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SliderIndexProvider()),
        ChangeNotifierProvider(create: (context) => MovieVideoIdProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightThemeData,
      // home: const MovieHome(),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
