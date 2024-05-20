import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/core/common/usecase/usecase.dart';
import 'package:tmbd_movie_app/features/movies/domain/usecases/upcoming_movies_usecase.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final UpComingMoviesUseCase _upComingMoviesUseCase;
  UpcomingMoviesBloc(UpComingMoviesUseCase upComingMoviesUseCase)
      : _upComingMoviesUseCase = upComingMoviesUseCase,
        super(UpcomingMoviesInitial()) {
    on<UpcomingMoviesEvent>((event, emit) async {
      emit(UpcomingMoviesLoadingState());
      try {
        final res = await _upComingMoviesUseCase.call(NoParam());
        res.fold((e) => emit(UpcomingMoviesFailureState(e.errorMsg)),
            (s) => emit(UpcomingMoviesSuccessState(s)));
      } catch (e) {
        emit(UpcomingMoviesFailureState(e.toString()));
      }
    });
  }
}
