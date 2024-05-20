class ApiUrls {
  static const baseMovieUrl = 'https://api.themoviedb.org/3/movie/';
  static const nowMovies = '${baseMovieUrl}now_playing';
  // static const latestMovies = '${baseMovieUrl}latest'; // most of Null Data
  static const popularMovies = '${baseMovieUrl}popular';
  static const topRatedMovies = '${baseMovieUrl}top_rated';
  static const upcomingMovies = '${baseMovieUrl}upcoming';
  static String similargMovies(String movieId) {
    return '$baseMovieUrl$movieId/similar';
  }

  static String videoUrl(String movieId) {
    return '$baseMovieUrl$movieId/videos';
  }

  static String reviewUrl(String movieId) {
    return 'https://api.themoviedb.org/3/movie/$movieId/reviews';
  }
// static const String aMovie='https://api.themoviedb.org/3/search/movie?query=k&include_adult=false&language=en-US&page=1';
  static const imageBaseUrl = 'https://image.tmdb.org/t/p/original';
  static const Map<String, String> header = {
    'accept': 'application/json',
    'Authorization':
        'Enter your token here'
  };
}
