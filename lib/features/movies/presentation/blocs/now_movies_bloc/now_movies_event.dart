part of 'now_movies_bloc.dart';

sealed class NowMoviesEvent extends Equatable {
  const NowMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchNowMoviesEvent extends NowMoviesEvent{}