import 'package:flutter/material.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';
import 'package:tmbd_movie_app/features/movies/presentation/argumennt/movie_details_page_arg.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/movie_details_page_widget/movie_details_appbar.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/movie_details_page_widget/movie_details_widget.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/movie_details_page_widget/movie_video_expandable.dart';

import '../widgets/movie_details_page_widget/movie_similar_widget.dart';
import '../widgets/movie_details_page_widget/movie_review.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late MovieDetailsPageArgument arg;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    arg =
        ModalRoute.of(context)!.settings.arguments as MovieDetailsPageArgument;

    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          MovieDetailAppBar(moviesEntities: arg.moviesEntities),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            // Movie Videos List - Expandable
            MovieVideoExpandable(movieId: arg.moviesEntities.id!),
            // Movie Details Content
            MovieDetailsWidget(movieId: arg.moviesEntities.id!),

            // Similar movies List Content
            SimilarMovieList(movieId: arg.moviesEntities.id!),

            // Movie Review Content
            MovieReview(movieId: arg.moviesEntities.id!),
          ]))
        ],
      ),
    ));
  }
}

errorMsgText(errorMsg) => Center(
      child: Text(
        errorMsg,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: AppPalate.red, fontSize: 18),
      ),
    );
