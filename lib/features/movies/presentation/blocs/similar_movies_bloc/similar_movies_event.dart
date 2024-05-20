// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'similar_movies_bloc.dart';

sealed class SimilarMoviesEvent extends Equatable {
  const SimilarMoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchSimilarMoviesEvent extends SimilarMoviesEvent {
  int movieId;
  FetchSimilarMoviesEvent({
    required this.movieId,
  });
}
