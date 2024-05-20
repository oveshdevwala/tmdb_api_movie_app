import 'dart:convert';

import 'package:tmbd_movie_app/core/constant/api_const/api_urls.dart';
import 'package:tmbd_movie_app/features/movies/data/datasources/remote/movies_remote_data_source.dart';
import 'package:tmbd_movie_app/features/movies/data/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:tmbd_movie_app/features/movies/data/models/movie_review_model.dart';
import 'package:tmbd_movie_app/features/movies/data/models/movie_video_model.dart';
import 'package:tmbd_movie_app/features/movies/data/models/movies_details_model.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  @override
  Future<MoviesModel> nowMovies() async {
    try {
      MoviesModel movies = await movieRequest(url: ApiUrls.nowMovies);

      return movies;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<MoviesModel> popularMovies() async {
    try {
      MoviesModel movies = await movieRequest(url: ApiUrls.popularMovies);
      return movies;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<MoviesModel> topRatedMovies() async {
    try {
      MoviesModel movies = await movieRequest(url: ApiUrls.topRatedMovies);
      return movies;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<MoviesModel> upComingMovies() async {
    try {
      MoviesModel movies = await movieRequest(url: ApiUrls.upcomingMovies);
      return movies;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<MoviesModel> movieRequest({
    required String url,
  }) async {
    late MoviesModel movies;
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri, headers: ApiUrls.header);
    if (res.statusCode == 200) {
      print(res.body);
      var data = jsonDecode(res.body);
      movies = MoviesModel.fromMap(data);
    } else {
      print("Status Code is Not 200");
    }
    return movies;
  }

  @override
  Future<MovieDetailsModel> movieDetailsById(int movieId) async {
    try {
      late MovieDetailsModel movieDetailsModel;
      Uri url = Uri.parse('${ApiUrls.baseMovieUrl}$movieId');
      http.Response res = await http.get(url, headers: ApiUrls.header);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        movieDetailsModel = MovieDetailsModel.fromJson(data);
      } else {
        print("Status Code is Not 200 at movieDetailsById");
      }
      return movieDetailsModel;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<MoviesModel> similarMovies(int movieId) async {
    try {
      var movie =
          await movieRequest(url: ApiUrls.similargMovies(movieId.toString()));
      return movie;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<MovieVideoModels> movieVideos(int movieId) async {
    try {
      late MovieVideoModels movieVideoModels;
      var url = Uri.parse(ApiUrls.videoUrl(movieId.toString()));
      var res = await http.get(url,headers: ApiUrls.header);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        movieVideoModels = MovieVideoModels.fromMap(data);
      }
      return movieVideoModels;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<MovieReviewModel> movieReview(int movieId) async {
    try {
      var res = await requestReviews(movieId);
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<MovieReviewModel> requestReviews(int movieId) async {
    late MovieReviewModel movieReviewModel;
    var url = Uri.parse(ApiUrls.reviewUrl(movieId.toString()));
    var res = await http.get(url,headers: ApiUrls.header);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      movieReviewModel = MovieReviewModel.fromMap(data);
    } else {
      print(res.statusCode);
      print(res.body);
      print(res.request);
      print('movie Review status code not 200');
    }
    return movieReviewModel;
  }
}
