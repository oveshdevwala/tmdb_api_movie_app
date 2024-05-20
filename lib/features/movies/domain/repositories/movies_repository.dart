import 'package:fpdart/fpdart.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_details_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_review_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_videos_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/core/common/failure/failure.dart';

abstract interface class MoviesRepository{
 Future<Either<Failure,MoviesEntities>> nowMovies();
 Future<Either<Failure,MoviesEntities>> popularMovies();
 Future<Either<Failure,MoviesEntities>> topRatedMovies();
 Future<Either<Failure,MoviesEntities>> upComingMovies();
 Future<Either<Failure,MoviesEntities>> similarMovies(int movieId);
 Future<Either<Failure,MovieDetailsEntities>> movieDetailsById(int movieId);
 Future<Either<Failure,MoviesReviewEntities>> movieReviews(int movieId);
 Future<Either<Failure,MovieVideosEntities>> movieVideos(int movieId);
}