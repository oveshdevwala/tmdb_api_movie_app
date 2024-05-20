import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/top_rate_movies_bloc/top_rated_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/upcoming_movies_bloc/upcoming_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/movie_home/movie_list/movie_list.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/movie_home/movie_list/movie_list_loading.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/movie_home/movie_slider/movie_slider.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  @override
  void initState() {
    context.read<PopularMoviesBloc>().add(FetchPopularMoviesEvent());
    context.read<UpcomingMoviesBloc>().add(FetchUpcominMoviesEvent());
    context.read<TopRatedMoviesBloc>().add(FetchTopRatedMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppPalate.transparent,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.line_horizontal_3,
                color: AppPalate.white,
              )),
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  'CINEVERS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppPalate.white),
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.person,
                    color: AppPalate.white,
                  ))
            ],
          ),
        ),
        backgroundColor: AppPalate.bluePrimary.withOpacity(0.5),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MovieSlider(),
                // Divider(color: AppPalate.greyS100.withOpacity(0.2), height: 20),
                BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                  builder: (context, state) {
                    if (state is PopularMoviesLoadingState) {
                      return MovieListLoading(title: 'Popular Movies');
                    } else if (state is PopularMoviesFailureState) {
                      return Center(child: Text(state.message));
                    } else if (state is PopularMoviesSuccessState) {
                      return MovieList(
                        title: 'Popular Movies',
                        movies: state.model,
                      );
                    }
                    return Container();
                  },
                ),
                Divider(color: AppPalate.greyS100.withOpacity(0.2), height: 20),
                BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
                  builder: (context, state) {
                    if (state is UpcomingMoviesLoadingState) {
                      return MovieListLoading(title: 'Upcoming Movies');
                    } else if (state is UpcomingMoviesFailureState) {
                      return Text(state.message);
                    } else if (state is UpcomingMoviesSuccessState) {
                      return MovieList(
                          movies: state.model, title: 'Upcoming Movies');
                    }
                    return Container();
                  },
                ),
                Divider(color: AppPalate.greyS100.withOpacity(0.2), height: 20),
                BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
                  builder: (context, state) {
                    if (state is TopRatedMoviesLoadingState) {
                      return MovieListLoading(title: 'Top Rated Movies');
                    } else if (state is TopRatedMoviesFailureState) {
                      return Text(state.message);
                    } else if (state is TopRatedMoviesSuccessState) {
                      return MovieList(
                          movies: state.model, title: 'Top Rated Movies');
                    }

                    return Container();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
