
// ignore_for_file: public_member_api_docs, sort_constructors_first
class MoviesReviewEntities {
  int? id;
  int? page;
  List<ReviewEntities?> results;
  int? totalPages;
  int? totalResults;
  MoviesReviewEntities({
    this.id,
    this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

}

class ReviewEntities {
  String? author;
  AutherEntities? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? postUrl;
  ReviewEntities({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.postUrl,
  });


}

class AutherEntities {
  String? name;
  String? userName;
  String? avatar;
  double? rating;
  AutherEntities({
    required this.name,
    required this.userName,
    required this.avatar,
    required this.rating,
  });

}
