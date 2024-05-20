import 'package:fpdart/fpdart.dart';
import 'package:tmbd_movie_app/core/common/failure/failure.dart';
import 'package:tmbd_movie_app/core/common/usecase/usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_videos_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/repositories/movies_repository.dart';

class MovieVideoUsecase implements UseCase<MovieVideosEntities, int> {
  final MoviesRepository repository;

  MovieVideoUsecase(this.repository);
  @override
  Future<Either<Failure, MovieVideosEntities>> call(int param) async =>
      await repository.movieVideos(param);
}
