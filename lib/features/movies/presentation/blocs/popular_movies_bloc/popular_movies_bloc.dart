import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/core/common/usecase/usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/popular_movies_usecase.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final PopularMoviesUseCase _popularMoviesUseCase;
  PopularMoviesBloc(PopularMoviesUseCase popularMoviesUseCase)
      : _popularMoviesUseCase = popularMoviesUseCase,
        super(PopularMoviesInitial()) {
    on<PopularMoviesEvent>((event, emit) async {
      emit(PopularMoviesLoadingState());
      try {
        final res = await _popularMoviesUseCase.call(NoParam());
        res.fold((e) => emit(PopularMoviesFailureState(e.errorMsg)),
            (s) => emit(PopularMoviesSuccessState(s)));
      } catch (e) {
        emit(PopularMoviesFailureState(e.toString()));
      }
    });
  }
}
