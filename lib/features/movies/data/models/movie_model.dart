import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';

class MoviesModel extends MoviesEntities {
  MoviesModel(
      {required super.dates,
      required super.page,
      required super.movies,
      required super.totalPages,
      required super.totalResults});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dates': dates,
      'page': page,
      'results': movies,
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory MoviesModel.fromMap(Map<String, dynamic> map) {
    List<MovieModel> listOfMovies = [];
    for (var eachMovie in map['results']) {
      listOfMovies.add(MovieModel.fromMap(eachMovie));
    }
    return MoviesModel(
      dates: DatesModel.fromMap(map['dates'] ?? {'minimum': '', 'maximum': ''}),
      page: map['page'] as int,
      movies: listOfMovies,
      totalPages: map['total_pages'] as int,
      totalResults: map['total_results'] as int,
    );
  }
}

class DatesModel extends DatesEntitie {
  DatesModel({required super.maximum, required super.minimum});
  Map<String, dynamic>? toMap() {
    return <String, dynamic>{
      'maximum': maximum,
      'minimum': minimum,
    };
  }

  factory DatesModel.fromMap(Map<String?, dynamic>? map) {
    return DatesModel(
      maximum: map!['maximum'],
      minimum: map['minimum'],
    );
  }
}

class MovieModel extends MovieEntitie {
  MovieModel(
      {required super.adult,
      required super.backdropath,
      required super.genreIds,
      required super.id,
      required super.originalLanguage,
      required super.originalTitle,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.video,
      required super.voteAverage,
      required super.voteCount});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    List<int> listOfInt = [];
    for (var eachint in map['genre_ids']) {
      listOfInt.add(eachint);
    }
    return MovieModel(
      adult: map['adult'] as bool,
      backdropath: map['backdrop_path'],
      genreIds: listOfInt,
      id: map['id'] as int,
      originalLanguage: map['original_language'] ,
      originalTitle: map['original_title'] ,
      overview: map['overview'] ,
      popularity: map['popularity'] as double,
      posterPath: map['poster_path'] ,
      releaseDate: map['release_date'] ,
      title: map['title'] ,
      video: map['video'] as bool,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
    );
  }
}
