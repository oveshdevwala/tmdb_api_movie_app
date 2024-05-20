// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/similar_movies_bloc/similar_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/movie_home/movie_list/movie_list.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/movie_home/movie_list/movie_list_loading.dart';

class SimilarMovieList extends StatefulWidget {
  SimilarMovieList({super.key, required this.movieId});
  int movieId;

  @override
  State<SimilarMovieList> createState() => _SimilarMovieListState();
}

class _SimilarMovieListState extends State<SimilarMovieList> {
  @override
  void initState() {
    context
        .read<SimilarMoviesBloc>()
        .add(FetchSimilarMoviesEvent(movieId: widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
      builder: (context, state) {
        if (state is SimilarMoviesLoadingState) {
          return MovieListLoading(title: 'Similar Movies');
        }

        if (state is SimilarMoviesFailureState) {
          return Center(child: Text(state.errorMsg));
        }
        if (state is SimilarMoviesSucessState) {
          if (state.movieDetailsEntities.movies!.isNotEmpty) {
            return MovieList(
                movies: state.movieDetailsEntities, title: 'Similar Movies');
          }
        }
        return Container();
      },
    );
  }
}
