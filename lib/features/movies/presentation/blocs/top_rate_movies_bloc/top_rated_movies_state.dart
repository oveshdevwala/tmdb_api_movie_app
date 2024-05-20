// ignore_for_file: must_be_immutable

part of 'top_rated_movies_bloc.dart';

sealed class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();
  
  @override
  List<Object> get props => [];
}

final class TopRatedMoviesInitial extends TopRatedMoviesState {}

class TopRatedMoviesLoadingState extends TopRatedMoviesState{}
class TopRatedMoviesSuccessState extends TopRatedMoviesState{   MoviesEntities model;
  TopRatedMoviesSuccessState(this.model,
  );
  }
class TopRatedMoviesFailureState extends TopRatedMoviesState{ String message;
  TopRatedMoviesFailureState(
    this.message,
  );}