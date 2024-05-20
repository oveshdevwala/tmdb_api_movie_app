// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/core/constant/api_const/api_urls.dart';
import 'package:tmbd_movie_app/core/constant/app_routes/app_routes.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';
import 'package:tmbd_movie_app/features/movies/presentation/argumennt/movie_details_page_arg.dart';

class MovieList extends StatelessWidget {
  MoviesEntities movies;
  String title;
  MovieList({super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppPalate.white,
                fontSize: 18),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.movies!.length,
            itemBuilder: (context, index) {
              var movie = movies.movies![index]!;
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.movieDetailsHome, (route) => true ,
                      arguments:
                          MovieDetailsPageArgument(moviesEntities: movie));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 25 : 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 220,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ColoredBox(
                              color: AppPalate.grey,
                              child: Image.network(
                                  '${ApiUrls.imageBaseUrl}${movie.posterPath}',
                                  fit: BoxFit.fitWidth),
                            )),
                      ),
                      // const SizedBox(height: 10),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 5),
                      //   child: SizedBox(
                      //     width: 150,
                      //     child: Text(
                      //       movie.title!,
                      //       // softWrap: true,
                      //       style: TextStyle(
                      //           overflow: TextOverflow.ellipsis,
                      //           color: AppPalate.white,
                      //           fontSize: 14),
                      //     ),
                      // ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
