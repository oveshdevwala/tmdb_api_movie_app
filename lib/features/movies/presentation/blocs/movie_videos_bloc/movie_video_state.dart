// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'movie_video_bloc.dart';

sealed class MovieVideoState extends Equatable {
  const MovieVideoState();

  @override
  List<Object> get props => [];
}

final class MovieVideoInitial extends MovieVideoState {}

class MovieVideoLoadingState extends MovieVideoState {}

class MovieVideoFailureState extends MovieVideoState {
  String errosMsg;
  MovieVideoFailureState(this.errosMsg);
}

class MovieVideoSuccesState extends MovieVideoState {
  MovieVideosEntities movieVideosEntities;
  MovieVideoSuccesState({
    required this.movieVideosEntities,
  });
}
