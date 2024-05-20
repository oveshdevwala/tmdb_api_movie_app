// ignore_for_file: must_be_immutable

part of 'upcoming_movies_bloc.dart';

sealed class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();
  
  @override
  List<Object> get props => [];
}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoadingState extends UpcomingMoviesState{}
class UpcomingMoviesSuccessState extends UpcomingMoviesState{   MoviesEntities model;
  UpcomingMoviesSuccessState(this.model,
  );
 }
class UpcomingMoviesFailureState extends UpcomingMoviesState{
   String message;
   UpcomingMoviesFailureState(
    this.message,
  );
}