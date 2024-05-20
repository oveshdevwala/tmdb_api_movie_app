// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tmbd_movie_app/core/constant/api_const/api_urls.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_review_entities.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_review_bloc/movie_review_bloc.dart';

class MovieReview extends StatefulWidget {
  MovieReview({super.key, required this.movieId});
  int movieId;
  @override
  State<MovieReview> createState() => _MovieReviewState();
}

class _MovieReviewState extends State<MovieReview> {
  @override
  void initState() {
    context.read<MovieReviewBloc>().add(MovieReviewFetchEvent(widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieReviewBloc, MovieReviewState>(
      builder: (context, state) {
        if (state is MovieReviewLoadingState) {}
        if (state is MovieReviewFailureState) {
          return Center(
              child: Text(
            state.errorMsg,
            style: TextStyle(color: AppPalate.white),
          ));
        }
        if (state is MovieReviewSuccessState) {
          if (state.moviesReviewEntities.results.isNotEmpty) {
            return MovieReviewWidgets(
                moviesReviewEntities: state.moviesReviewEntities);
          }
        }
        return const SizedBox();
      },
    );
  }
}

class MovieReviewWidgets extends StatefulWidget {
  MovieReviewWidgets({super.key, required this.moviesReviewEntities});
  MoviesReviewEntities moviesReviewEntities;

  @override
  State<MovieReviewWidgets> createState() => _MovieReviewWidgetsState();
}

class _MovieReviewWidgetsState extends State<MovieReviewWidgets> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews',
            style: TextStyle(
              fontSize: 20,
              color: AppPalate.white,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.moviesReviewEntities.results.length,
            itemBuilder: (context, index) {
              var review = widget.moviesReviewEntities.results[index];
              // print('review.authorDetails!.avatar');
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: AppPalate.bluePrimary),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width / 3),
                    child: review!.authorDetails!.avatar != null
                        ? SizedBox(
                            width: 50,
                            child: Image.network(
                              '${ApiUrls.imageBaseUrl}/${review.authorDetails!.avatar}',
                              fit: BoxFit.cover,
                            ),
                          )
                        : const SizedBox(
                            width: 50, child: Icon(CupertinoIcons.person)),
                  ),
                  title: Text(
                    review.authorDetails!.name ?? 'unknown user',
                    style: TextStyle(color: AppPalate.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        review.content!,
                        maxLines: 4,
                        style: TextStyle(color: AppPalate.white),
                      ),
                      Text(
                        DateFormat.yMEd()
                            .format(DateTime.parse(review.createdAt!)),
                        style: TextStyle(color: AppPalate.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
