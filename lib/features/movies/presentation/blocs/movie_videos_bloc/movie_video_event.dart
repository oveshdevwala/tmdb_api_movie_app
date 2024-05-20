// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'movie_video_bloc.dart';

sealed class MovieVideoEvent extends Equatable {
  const MovieVideoEvent();

  @override
  List<Object> get props => [];
}

class MovieVideoFetchEvent extends MovieVideoEvent {
  int movieId;
  MovieVideoFetchEvent({
    required this.movieId,
  });
}
