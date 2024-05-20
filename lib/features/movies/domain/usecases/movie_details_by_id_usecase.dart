import 'package:fpdart/fpdart.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_details_entities.dart';
import 'package:tmbd_movie_app/core/common/failure/failure.dart';
import 'package:tmbd_movie_app/core/common/usecase/usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/repositories/movies_repository.dart';

class MovieDetailsByIdUseCase implements UseCase<MovieDetailsEntities, int> {
  final MoviesRepository repositiry;

  MovieDetailsByIdUseCase(this.repositiry);
  @override
  Future<Either<Failure, MovieDetailsEntities>> call(int movieId) async =>
      await repositiry.movieDetailsById(movieId);
}
