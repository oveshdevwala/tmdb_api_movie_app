// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tmbd_movie_app/core/constant/api_const/api_urls.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_videos_entities.dart';
import 'package:tmbd_movie_app/features/movies/domain/entitites/movies_entities.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_videos_bloc/movie_video_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/providers/video_id_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailAppBar extends StatefulWidget {
  MovieDetailAppBar({super.key, required this.moviesEntities});
  MovieEntitie moviesEntities;
  @override
  State<MovieDetailAppBar> createState() => _MovieDetailAppBarState();
}

class _MovieDetailAppBarState extends State<MovieDetailAppBar> {
  bool playVideo = false;
  @override
  void initState() {
    context
        .read<MovieVideoBloc>()
        .add(MovieVideoFetchEvent(movieId: widget.moviesEntities.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SliverAppBar(
        foregroundColor: AppPalate.bluePrimary,
        backgroundColor: AppPalate.bluePrimary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(backgroundColor: AppPalate.black),
            icon: Icon(
              CupertinoIcons.back,
              color: AppPalate.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: IconButton.styleFrom(backgroundColor: AppPalate.black),
              icon: Icon(
                CupertinoIcons.bookmark,
                color: AppPalate.white,
              )),
          const SizedBox(width: 10)
        ],
        // title: const SizedBox(
        //   width: 300,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [],
        //   ),
        // ),
        expandedHeight: mq.height * 0.4,
        flexibleSpace: FlexibleSpaceBar(
          // title: Text(
          //   arg.moviesEntities.title!,
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: AppPalate.black,fontSize: 18
          //   ),
          // ),

          background: SizedBox(
            height: mq.height * 0.4,
            width: double.infinity,
            child: BlocBuilder<MovieVideoBloc, MovieVideoState>(
              builder: (context, state) {
                if (state is MovieVideoFailureState) {
                  return Center(child: Text(state.errosMsg));
                } else if (state is MovieVideoLoadingState) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppPalate.white,
                  ));
                }
                if (state is MovieVideoSuccesState) {
                  if (state.movieVideosEntities.mVideoEntities!.isNotEmpty) {
                    return MovieTrailerVideo(
                      movieEntities: widget.moviesEntities,
                      videoEntities: state.movieVideosEntities,
                    );
                  } else {
                    return MovieThumbnail(movieEntities: widget.moviesEntities);
                  }
                }
                return const SizedBox();
              },
            ),
          ),
        ));
  }
}

class MovieTrailerVideo extends StatefulWidget {
  MovieTrailerVideo(
      {super.key, required this.videoEntities, required this.movieEntities});
  MovieVideosEntities videoEntities;
  MovieEntitie movieEntities;
  @override
  State<MovieTrailerVideo> createState() => _MovieTrailerVideoState();
}

class _MovieTrailerVideoState extends State<MovieTrailerVideo> {
  late YoutubePlayerController _controller;
  late String currentVideo;
  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoEntities.mVideoEntities!.first!.key!,
      flags: const YoutubePlayerFlags(autoPlay: true, hideThumbnail: false),
    );
  }

  @override
  void dispose() {
    // _controller.load(widget.videoEntities.mVideoEntities![0]!.key.toString());
    // context.read<MovieVideoIdProvider>().videoId =
    //     widget.videoEntities.mVideoEntities!.first!.key!;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Change ${context.read<MovieVideoIdProvider>().videoId}');
    return Consumer<MovieVideoIdProvider>(builder: (context, provider, child) {
      String newVideoId = provider.videoId;
      if (_controller.initialVideoId != newVideoId) {
        _controller.load(newVideoId);
        _controller.play();
      } else if (newVideoId == '') {
        context.read<MovieVideoIdProvider>().videoId =
            widget.videoEntities.mVideoEntities!.first!.key;
        _controller.load(widget.videoEntities.mVideoEntities!.first!.key!);
      }

      return YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppPalate.grey,
        thumbnail: MovieThumbnail(movieEntities: widget.movieEntities),
        progressColors: const ProgressBarColors(
            playedColor: Colors.amber, handleColor: Colors.amberAccent),
      );
    });
  }
}

class MovieThumbnail extends StatefulWidget {
  MovieThumbnail({super.key, required this.movieEntities});
  MovieEntitie movieEntities;

  @override
  State<MovieThumbnail> createState() => _MovieThumbnailState();
}

class _MovieThumbnailState extends State<MovieThumbnail> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: SizedBox(
      child: widget.movieEntities.backdropath != null
          ? Image.network(
              ApiUrls.imageBaseUrl +
                  widget.movieEntities.backdropath.toString(),
              fit: BoxFit.cover)
          : Image.network(
              ApiUrls.imageBaseUrl + widget.movieEntities.posterPath.toString(),
              fit: BoxFit.cover),
    ));
  }
}
                          // SizedBox(
                          //   height: 40,
                          //   width: 40,
                          //   child: IconButton(
                          //       onPressed: () {
                          //         playVideo = true;
                          //         setState(() {});
                          //       },
                          //       icon: Icon(playVideo
                          //           ? Icons.stop_circle
                          //           : Icons.play_arrow_rounded)),
                          // )