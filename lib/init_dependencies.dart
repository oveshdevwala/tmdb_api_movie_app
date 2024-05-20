import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tmbd_movie_app/features/movies/data/datasources/remote/movies_remote_data_source.dart';
import 'package:tmbd_movie_app/features/movies/data/datasources/remote/movies_remote_data_source_impl.dart';
import 'package:tmbd_movie_app/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:tmbd_movie_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/movie_details_by_id_usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/movie_review_usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/movie_video_usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/now_movies_usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/popular_movies_usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/similer_movies_usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/top_rated_movies_usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/upcoming_movies_usecase.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_details_by_id_bloc/movie_details_by_id_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_review_bloc/movie_review_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_videos_bloc/movie_video_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/now_movies_bloc/now_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/similar_movies_bloc/similar_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/top_rate_movies_bloc/top_rated_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/upcoming_movies_bloc/upcoming_movies_bloc.dart';
import 'package:hive/hive.dart';
final sl = GetIt.instance;
Future<void> initDependencies() async {
  _initmovies();
  // Core
  // Database
  final docDir = await getApplicationDocumentsDirectory();
  Hive.init(docDir.path);
  // Local Storage
}

void _initmovies() {
  sl
    // DataSource
    ..registerFactory<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl())
    // Repository
    ..registerFactory<MoviesRepository>(
        () => MoviesRepositoryImpl(moviesRemoteDataSource: sl()))

    // UseCase
    ..registerFactory(() => NowMoviesUseCase(sl()))
    ..registerFactory(() => UpComingMoviesUseCase(sl()))
    ..registerFactory(() => PopularMoviesUseCase(sl()))
    ..registerFactory(() => TopRatedMoviesUseCase(sl()))
    ..registerFactory(() => MovieDetailsByIdUseCase(sl()))
    ..registerFactory(() => SimilarMovieUsecase(sl()))
    ..registerFactory(() => MovieReviewUsecase(sl()))
    ..registerFactory(() => MovieVideoUsecase(sl()))

    // Bloc
    ..registerLazySingleton(() => TopRatedMoviesBloc(sl()))
    ..registerLazySingleton(() => UpcomingMoviesBloc(sl()))
    ..registerLazySingleton(() => NowMoviesBloc(sl()))
    ..registerLazySingleton(() => PopularMoviesBloc(sl()))
    ..registerLazySingleton(() => MovieDetailsByIdBloc(sl()))
    ..registerLazySingleton(() => SimilarMoviesBloc(sl()))
    ..registerLazySingleton(() => MovieVideoBloc(sl()))
    ..registerLazySingleton(() => MovieReviewBloc(sl()));
}
