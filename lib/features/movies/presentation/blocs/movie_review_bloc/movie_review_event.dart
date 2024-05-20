// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'movie_review_bloc.dart';

sealed class MovieReviewEvent extends Equatable {
  const MovieReviewEvent();

  @override
  List<Object> get props => [];
}

class MovieReviewFetchEvent extends MovieReviewEvent {
  int movieId;
  MovieReviewFetchEvent(
    this.movieId,
  );
}
