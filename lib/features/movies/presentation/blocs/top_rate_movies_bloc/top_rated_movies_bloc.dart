import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_movie_app/core/common/usecase/usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/top_rated_movies_usecase.dart';

import '../../../domain/entitites/movies_entities.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final TopRatedMoviesUseCase _topRatedMoviesUseCase;
  TopRatedMoviesBloc(TopRatedMoviesUseCase topRatedMoviesUseCase)
      : _topRatedMoviesUseCase = topRatedMoviesUseCase,
        super(TopRatedMoviesInitial()) {
    on<TopRatedMoviesEvent>((event, emit) async {
      emit(TopRatedMoviesLoadingState());
      try {
        final res = await _topRatedMoviesUseCase.call(NoParam());
        res.fold((e) => emit(TopRatedMoviesFailureState(e.errorMsg)),
            (s) => emit(TopRatedMoviesSuccessState(s)));
      } catch (e) {
        emit(TopRatedMoviesFailureState(e.toString()));
      }
    });
  }
}
