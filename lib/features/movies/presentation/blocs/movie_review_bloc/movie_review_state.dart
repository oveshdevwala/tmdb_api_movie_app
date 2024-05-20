// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'movie_review_bloc.dart';

sealed class MovieReviewState extends Equatable {
  const MovieReviewState();

  @override
  List<Object> get props => [];
}

final class MovieReviewInitial extends MovieReviewState {}

class MovieReviewFailureState extends MovieReviewState {
  String errorMsg;
  MovieReviewFailureState(this.errorMsg,
  );
}

class MovieReviewLoadingState extends MovieReviewState {}

class MovieReviewSuccessState extends MovieReviewState {
  MoviesReviewEntities moviesReviewEntities;
  MovieReviewSuccessState(this.moviesReviewEntities,
  );
}
