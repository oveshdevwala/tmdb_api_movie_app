import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_review_entities.dart';

class MovieReviewModel extends MoviesReviewEntities {
  MovieReviewModel(
      {required super.id,
      required super.page,
      required super.results,
      required super.totalPages,
      required super.totalResults});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'page': page,
      'results': results,
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }

  factory MovieReviewModel.fromMap(Map<String, dynamic> map) {
    List<ReviewModel> listOfReviews = [];
    for (var eachReview in map['results']) {
      // if (eachReview != null || eachReview != '') {
      listOfReviews.add(ReviewModel.fromMap(eachReview));
      // }
    }
    return MovieReviewModel(
      id: map['id'],
      page: map['page'],
      results: listOfReviews,
      totalPages: map['totalPages'],
      totalResults: map['totalResults'],
    );
  }
}

class ReviewModel extends ReviewEntities {
  ReviewModel(
      {required super.author,
      required super.authorDetails,
      required super.content,
      required super.createdAt,
      required super.id,
      required super.updatedAt,
      required super.postUrl});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'author_details': authorDetails,
      'content': content,
      'created_at': createdAt,
      'id': id,
      'updated_at': updatedAt,
      'url': postUrl,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      author: map['author'],
      authorDetails: AutherModel.fromMap(map['author_details']),
      content: map['content'],
      createdAt: map['created_at'],
      id: map['id'],
      updatedAt: map['updated_at'],
      postUrl: map['url'],
    );
  }
}

class AutherModel extends AutherEntities {
  AutherModel(
      {required super.name,
      required super.userName,
      required super.avatar,
      required super.rating});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'userName': userName,
      'avatar': avatar,
      'rating': rating,
    };
  }

  factory AutherModel.fromMap(Map<String, dynamic> map) {
    return AutherModel(
      name: map['name'],
      userName: map['user_name'],
      avatar: map['avatar_path'],
      rating: map['rating'],
    );
  }
}
