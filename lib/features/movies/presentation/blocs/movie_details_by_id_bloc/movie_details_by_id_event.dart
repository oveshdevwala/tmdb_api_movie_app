// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'movie_details_by_id_bloc.dart';

sealed class MovieDetailsByIdEvent extends Equatable {
  const MovieDetailsByIdEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieDetailsByIdEventById extends MovieDetailsByIdEvent {
  int movieid;
  FetchMovieDetailsByIdEventById({
    required this.movieid,
  });
}
