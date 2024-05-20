
// ignore_for_file: public_member_api_docs, sort_constructors_first
class MoviesEntities {
  DatesEntitie? dates;
  int? page;
  List<MovieEntitie?>? movies;
  int? totalPages;
  int? totalResults;
  MoviesEntities({
    required this.dates,
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });


}

class DatesEntitie {
  String? maximum;
  String? minimum;
  DatesEntitie({
    required this.maximum,
    required this.minimum,
  });



}

class MovieEntitie {
  bool? adult;
  String? backdropath;
  List<int?>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  MovieEntitie({
    required this.adult,
    required this.backdropath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });



}
