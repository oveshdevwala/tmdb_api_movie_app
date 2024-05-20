// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';
import 'package:tmbd_movie_app/core/utiles/my_shimmer_container.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/movie_videos_bloc/movie_video_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/pages/movie_details_page.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/providers/video_id_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieVideoExpandable extends StatefulWidget {
  MovieVideoExpandable({super.key, required this.movieId});
  int movieId;
  @override
  State<MovieVideoExpandable> createState() => _MovieVideoExpandableState();
}

class _MovieVideoExpandableState extends State<MovieVideoExpandable> {
  late Size mq;
  @override
  void initState() {
    context
        .read<MovieVideoBloc>()
        .add(MovieVideoFetchEvent(movieId: widget.movieId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return ExpansionTile(
        collapsedIconColor: AppPalate.grey,
        iconColor: AppPalate.white,
        title: Text(
          'Play Videos',
          style: TextStyle(color: AppPalate.white, fontSize: 22),
        ),
        children: [
          BlocBuilder<MovieVideoBloc, MovieVideoState>(
            builder: (context, state) {
              if (state is MovieVideoLoadingState) {
                return SizedBox(
                  width: mq.width,
                  height: 25,
                  child: const MyShimmerContainer(),
                );
              }
              if (state is MovieVideoSuccesState) {
                return SizedBox(
                  height: mq.height * 0.35,
                  width: 280,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.movieVideosEntities.mVideoEntities!.length,
                    itemBuilder: (context, index) {
                      var video =
                          state.movieVideosEntities.mVideoEntities![index]!;
                      String thumblneil = YoutubePlayer.getThumbnail(
                          videoId: video.key.toString(),
                          quality: ThumbnailQuality.standard);
                      print(thumblneil);
                      print('Video Key ${video.key!}');
                      return ListTile(
                        onTap: () {
                          context.read<MovieVideoIdProvider>().videoId =
                              video.key.toString();
                        },
                        contentPadding: const EdgeInsets.all(10),
                        title: Container(
                          // width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              color: AppPalate.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: thumblneil != ''
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    thumblneil,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : errorMsgText('No Thumbnails'),
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          )
        ]);
  }
}

class VideoTitle extends StatefulWidget {
  VideoTitle({super.key, required this.vId});
  String vId;
  @override
  State<VideoTitle> createState() => _VideoTitleState();
}

class _VideoTitleState extends State<VideoTitle> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    controller = YoutubePlayerController(initialVideoId: widget.vId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      controller.metadata.title,
      style: TextStyle(color: AppPalate.white, fontSize: 20),
    );
  }
}
