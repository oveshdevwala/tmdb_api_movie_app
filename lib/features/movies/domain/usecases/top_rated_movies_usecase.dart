// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/core/common/failure/failure.dart';
import 'package:tmbd_movie_app/core/common/usecase/usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/repositories/movies_repository.dart';

class TopRatedMoviesUseCase implements UseCase<MoviesEntities, NoParam> {
  final MoviesRepository repository;
  TopRatedMoviesUseCase(this.repository);
  @override
  Future<Either<Failure, MoviesEntities>> call(NoParam param) async =>
      await repository.topRatedMovies();
}
