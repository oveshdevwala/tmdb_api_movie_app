// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'now_movies_bloc.dart';

sealed class NowMoviesState extends Equatable {
  const NowMoviesState();

  @override
  List<Object> get props => [];
}

final class NowMoviesInitial extends NowMoviesState {}

class NowMoviesLoadingState extends NowMoviesState {}

class NowMoviesSuccessState extends NowMoviesState {
  MoviesEntities model;
  NowMoviesSuccessState(this.model,
  );
}

class NowMoviesFailureState extends NowMoviesState {
  String message;
  NowMoviesFailureState(
    this.message,
  );
}
