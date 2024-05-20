// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'movie_details_by_id_bloc.dart';

sealed class MovieDetailsByIdState extends Equatable {
  const MovieDetailsByIdState();

  @override
  List<Object> get props => [];
}

final class MovieDetailsByIdInitial extends MovieDetailsByIdState {}

class MovieDetailsByIdLoadingState extends MovieDetailsByIdState {}

class MovieDetailsByIdFailureState extends MovieDetailsByIdState {
  String errorMsg;
  MovieDetailsByIdFailureState({
    required this.errorMsg,
  });
}

class MovieDetailsByIdSucessState extends MovieDetailsByIdState {
  MovieDetailsEntities movieDetailsEntities;
  MovieDetailsByIdSucessState({
    required this.movieDetailsEntities,
  });
}
