// import 'package:flutter/cupertino.dart';
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_details_entities.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_details_by_id_bloc/movie_details_by_id_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/pages/movie_details_page.dart';

import '../../../../../core/utiles/my_shimmer_container.dart';

class MovieDetailsWidget extends StatefulWidget {
  MovieDetailsWidget({super.key, required this.movieId});
  int movieId;
  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void initState() {
    context
        .read<MovieDetailsByIdBloc>()
        .add(FetchMovieDetailsByIdEventById(movieid: widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return BlocBuilder<MovieDetailsByIdBloc, MovieDetailsByIdState>(
      builder: (context, state) {
        if (state is MovieDetailsByIdFailureState) {
          return errorMsgText(state.errorMsg);
        }
        if (state is MovieDetailsByIdLoadingState) {
          return MovieDetailesLoadingWidget(mq: mq);
        }
        if (state is MovieDetailsByIdSucessState) {
          var movie = state.movieDetailsEntities;
          return MovieContentWidgets(movie: movie);
        }
        return Container();
      },
    );
  }
}

class MovieDetailesLoadingWidget extends StatelessWidget {
  const MovieDetailesLoadingWidget({
    super.key,
    required this.mq,
  });

  final Size mq;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: mq.width * 0.75,
            height: 25,
            child: const MyShimmerContainer(),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 25,
                  child: MyShimmerContainer(),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                    width: double.infinity,
                    height: 25.0,
                    child: MyShimmerContainer()),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: mq.width,
            height: 25,
            child: const MyShimmerContainer(),
          ),
          const SizedBox(height: 10),
          const SizedBox(
            width: double.infinity,
            height: 25,
            child: MyShimmerContainer(),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

class MovieContentWidgets extends StatelessWidget {
  const MovieContentWidgets({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntities movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${movie.title!} - ${movie.tagline}',
            softWrap: true,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppPalate.white,
                fontSize: 20),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppPalate.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.time,
                        color: AppPalate.grey,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Builder(builder: (context) {
                        int hours = (movie.runtime! ~/ 60);
                        int min = movie.runtime! % 60;
                        return Text(
                          '${hours}h ${min}m',
                          softWrap: true,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppPalate.white,
                              fontSize: 14),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppPalate.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        color: AppPalate.grey,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text('${movie.voteAverage}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppPalate.white,
                              fontSize: 14)),
                      const SizedBox(width: 5),
                      Text('(${movie.voteCount})',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppPalate.white,
                              fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppPalate.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${movie.releaseDate!.split('-').first} ',
                        style: TextStyle(color: AppPalate.white, fontSize: 15),
                      ),
                      Text('${movie.status}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppPalate.white,
                              fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: movie.genres!.map((e) {
              String text;
              if (e.name == movie.genres!.last.name) {
                text = e.name!;
              } else {
                text = '${e.name},';
              }
              return Padding(
                padding: const EdgeInsets.all(3),
                child: Text(
                  text,
                  style: TextStyle(color: AppPalate.grey, fontSize: 16),
                ),
              );
            }).toList()),
          ),
          const SizedBox(height: 12),
          Text(
            movie.overview!,
            // softWrap: true,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: AppPalate.greyS200,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          // Text(
          //   movie.belongsToCollection!.name.toString(),
          //   textAlign: TextAlign.justify,
          //   style: TextStyle(
          //     color: AppPalate.greyS200,
          //     fontSize: 13,
          //   ),
          // ),
        ],
      ),
    );
  }
}
