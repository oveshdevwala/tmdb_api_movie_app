import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_videos_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/movie_video_usecase.dart';

part 'movie_video_event.dart';
part 'movie_video_state.dart';

class MovieVideoBloc extends Bloc<MovieVideoEvent, MovieVideoState> {
  final MovieVideoUsecase _movieVideoUsecase;
  MovieVideoBloc(MovieVideoUsecase movieVideoUsecase)
      : _movieVideoUsecase = movieVideoUsecase,
        super(MovieVideoInitial()) {
    on<MovieVideoFetchEvent>((event, emit) async {
      emit(MovieVideoLoadingState());
      try {
        var res = await _movieVideoUsecase.call(event.movieId);
        res.fold((e) => emit(MovieVideoFailureState(e.errorMsg)),
            (s) => emit(MovieVideoSuccesState(movieVideosEntities: s)));
      } catch (e) {
        emit(MovieVideoFailureState(e.toString()));
      }
    });
  }
}
