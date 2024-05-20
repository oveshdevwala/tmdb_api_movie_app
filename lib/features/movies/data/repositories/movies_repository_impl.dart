// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_details_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_review_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_videos_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/core/common/failure/failure.dart';
import 'package:tmbd_movie_app/features/movies/data/datasources/remote/movies_remote_data_source.dart';
import 'package:tmbd_movie_app/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  MoviesRepositoryImpl({
    required this.moviesRemoteDataSource,
  });
  @override
  Future<Either<Failure, MoviesEntities>> nowMovies() async {
    try {
      var movies = await moviesRemoteDataSource.nowMovies();
      return right(movies);
    } on SocketException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MoviesEntities>> popularMovies() async {
    try {
      var movies = await moviesRemoteDataSource.popularMovies();
      return right(movies);
    } on SocketException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MoviesEntities>> topRatedMovies() async {
    try {
      var movies = await moviesRemoteDataSource.topRatedMovies();
      return right(movies);
    } on SocketException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MoviesEntities>> upComingMovies() async {
    try {
      var movies = await moviesRemoteDataSource.upComingMovies();
      return right(movies);
    } on SocketException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntities>> movieDetailsById(int id) async {
    try {
      var moviesDetails = await moviesRemoteDataSource.movieDetailsById(id);
      return right(moviesDetails);
    } on SocketException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MoviesEntities>> similarMovies(int movieId) async {
    try {
      var movies = await moviesRemoteDataSource.similarMovies(movieId);
      return right(movies);
    } on SocketException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MoviesReviewEntities>> movieReviews(
      int movieId) async {
    try {
      var movies = await moviesRemoteDataSource.movieReview(movieId);
      return right(movies);
    } on SocketException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieVideosEntities>> movieVideos(int movieId) async {
    try {
      var movies = await moviesRemoteDataSource.movieVideos(movieId);
      return right(movies);
    } on SocketException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
