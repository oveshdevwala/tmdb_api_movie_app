import 'package:fpdart/fpdart.dart';
import 'package:tmbd_movie_app/core/common/failure/failure.dart';
import 'package:tmbd_movie_app/core/common/usecase/usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_review_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/repositories/movies_repository.dart';

class MovieReviewUsecase implements UseCase<MoviesReviewEntities, int> {
  final MoviesRepository repository;

  MovieReviewUsecase(this.repository);
  @override
  Future<Either<Failure, MoviesReviewEntities>> call(int movieId) async =>
      await repository.movieReviews(movieId);
}
