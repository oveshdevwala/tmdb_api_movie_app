import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_details_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/movie_details_by_id_usecase.dart';

part 'movie_details_by_id_event.dart';
part 'movie_details_by_id_state.dart';

class MovieDetailsByIdBloc
    extends Bloc<MovieDetailsByIdEvent, MovieDetailsByIdState> {
  final MovieDetailsByIdUseCase _movieDetailsByIdUseCase;
  MovieDetailsByIdBloc(MovieDetailsByIdUseCase movieDetailsByIdUseCase)
      : _movieDetailsByIdUseCase = movieDetailsByIdUseCase,
        super(MovieDetailsByIdInitial()) {
    on<FetchMovieDetailsByIdEventById>((event, emit) async {
      emit(MovieDetailsByIdLoadingState());
      try {
        final res = await _movieDetailsByIdUseCase.call(event.movieid);
        res.fold(
            (e) => emit(MovieDetailsByIdFailureState(errorMsg: e.errorMsg)),
            (s) => emit(MovieDetailsByIdSucessState(movieDetailsEntities: s)));
      } catch (e) {
        emit(MovieDetailsByIdFailureState(errorMsg: e.toString()));
      }
    });
  }
}
