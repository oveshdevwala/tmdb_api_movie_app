import 'package:tmbd_movie_app/features/movies/data/models/movie_model.dart';
import 'package:tmbd_movie_app/features/movies/data/models/movie_review_model.dart';
import 'package:tmbd_movie_app/features/movies/data/models/movie_video_model.dart';
import 'package:tmbd_movie_app/features/movies/data/models/movies_details_model.dart';

abstract interface class MoviesRemoteDataSource {
  Future<MoviesModel> nowMovies();
  Future<MoviesModel> popularMovies();
  Future<MoviesModel> topRatedMovies();
  Future<MoviesModel> upComingMovies();
  Future<MoviesModel> similarMovies(int movieId);
  Future<MovieDetailsModel> movieDetailsById(int movieId);
  Future<MovieReviewModel> movieReview(int movieId);
  Future<MovieVideoModels> movieVideos(int movieId);
}
