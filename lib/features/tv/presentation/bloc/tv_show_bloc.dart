import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_show_event.dart';
part 'tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  TvShowBloc() : super(TvShowInitial()) {
    on<TvShowEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
