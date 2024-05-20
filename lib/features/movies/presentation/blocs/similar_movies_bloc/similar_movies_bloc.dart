import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/similer_movies_usecase.dart';

part 'similar_movies_event.dart';
part 'similar_movies_state.dart';

class SimilarMoviesBloc extends Bloc<SimilarMoviesEvent, SimilarMoviesState> {
  final SimilarMovieUsecase _similarMovieUsecase;
  SimilarMoviesBloc(SimilarMovieUsecase similarMovieUsecase)
      : _similarMovieUsecase = similarMovieUsecase,
        super(SimilarMoviesInitial()) {
    on<FetchSimilarMoviesEvent>((event, emit) async {
      emit(SimilarMoviesLoadingState());
      try {
        final res = await _similarMovieUsecase.call(event.movieId);
        res.fold((e) => emit(SimilarMoviesFailureState(errorMsg: e.errorMsg)),
            (s) => emit(SimilarMoviesSucessState(movieDetailsEntities: s)));
      } catch (e) {
        emit(SimilarMoviesFailureState(errorMsg: e.toString()));
      }
    });
  }
}
