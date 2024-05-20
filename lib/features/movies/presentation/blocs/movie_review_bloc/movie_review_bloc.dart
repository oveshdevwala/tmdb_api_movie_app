import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_review_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/movie_review_usecase.dart';
part 'movie_review_event.dart';
part 'movie_review_state.dart';

class MovieReviewBloc extends Bloc<MovieReviewEvent, MovieReviewState> {
  final MovieReviewUsecase _movieReviewUsecase;
  MovieReviewBloc(MovieReviewUsecase movieReviewUsecase)
      : _movieReviewUsecase = movieReviewUsecase,
        super(MovieReviewInitial()) {
    on<MovieReviewFetchEvent>((event, emit) async {
      emit(MovieReviewLoadingState());
      try {
        var res = await _movieReviewUsecase.call(event.movieId);
        res.fold((l) => emit(MovieReviewFailureState(l.errorMsg)),
            (r) => emit(MovieReviewSuccessState(r)));
      } catch (e) {
        emit(MovieReviewFailureState(e.toString()));
      }
    });
  }
}
