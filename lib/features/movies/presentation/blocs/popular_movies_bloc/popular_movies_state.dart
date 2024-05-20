// ignore_for_file: must_be_immutable

part of 'popular_movies_bloc.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();
  
  @override
  List<Object> get props => [];
}

final class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoadingState extends PopularMoviesState{}
class PopularMoviesSuccessState extends PopularMoviesState{
   MoviesEntities model;
  PopularMoviesSuccessState(this.model,
  );
  
}
class PopularMoviesFailureState extends PopularMoviesState{
 String message;
  PopularMoviesFailureState(
    this.message,
  );
}