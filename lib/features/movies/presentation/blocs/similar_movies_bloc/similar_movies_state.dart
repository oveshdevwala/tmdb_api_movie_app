// ignore_for_file: must_be_immutable

part of 'similar_movies_bloc.dart';

sealed class SimilarMoviesState extends Equatable {
  const SimilarMoviesState();
  
  @override
  List<Object> get props => [];
}

final class SimilarMoviesInitial extends SimilarMoviesState {}
class SimilarMoviesLoadingState extends SimilarMoviesState {}

class SimilarMoviesFailureState extends SimilarMoviesState {
  String errorMsg;
  SimilarMoviesFailureState({
    required this.errorMsg,
  });
}

class SimilarMoviesSucessState extends SimilarMoviesState {
  MoviesEntities movieDetailsEntities;
  SimilarMoviesSucessState({
    required this.movieDetailsEntities,
  });
}
