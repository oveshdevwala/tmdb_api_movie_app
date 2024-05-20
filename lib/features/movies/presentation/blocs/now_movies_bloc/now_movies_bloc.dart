import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/core/common/usecase/usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/now_movies_usecase.dart';

part 'now_movies_event.dart';
part 'now_movies_state.dart';

class NowMoviesBloc extends Bloc<NowMoviesEvent, NowMoviesState> {
  final NowMoviesUseCase _nowMoviesUseCase;
  NowMoviesBloc(NowMoviesUseCase nowMoviesUseCase)
      : _nowMoviesUseCase = nowMoviesUseCase,
        super(NowMoviesInitial()) {
    on<FetchNowMoviesEvent>((event, emit) async {
      emit(NowMoviesLoadingState());
      try {
        final res = await _nowMoviesUseCase.call(NoParam());
        res.fold((e) => emit(NowMoviesFailureState(e.errorMsg)),
            (s) => emit(NowMoviesSuccessState(s)));
      } catch (e) {
        emit(NowMoviesFailureState(e.toString()));
      }
    });
  }
}
