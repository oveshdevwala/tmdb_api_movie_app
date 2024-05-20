import 'package:fpdart/fpdart.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/core/common/failure/failure.dart';
import 'package:tmbd_movie_app/core/common/usecase/usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/repositories/movies_repository.dart';

class SimilarMovieUsecase implements UseCase<MoviesEntities, int> {
  final MoviesRepository repository;

  SimilarMovieUsecase(this.repository);
  @override
  Future<Either<Failure, MoviesEntities>> call(int movieId) async =>
      await repository.similarMovies(movieId);
}
