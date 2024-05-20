import 'package:tmbd_movie_app/features/movies/domain/entitites/movie_videos_entities.dart';

class MovieVideoModels extends MovieVideosEntities {
  MovieVideoModels({required super.id, required super.mVideoEntities});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mVideoEntities': mVideoEntities,
    };
  }

  factory MovieVideoModels.fromMap(Map<String, dynamic> map) {
    List<VideoModel> listOfVideos = [];
    for (var eachVideo in map['results']) {
      if (eachVideo != null || eachVideo != '') {
        listOfVideos.add(VideoModel.fromMap(eachVideo));
      }
    }
    return MovieVideoModels(
      id: map['id'] != null ? map['id'] as int : null,
      mVideoEntities: listOfVideos,
    );
  }
}

class VideoModel extends VideoEntities {
  VideoModel(
      {required super.iso31661,
      required super.iso6391,
      required super.key,
      required super.site,
      required super.size,
      required super.type,
      required super.offical,
      required super.publichedAt,
      required super.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso31661': iso31661,
      'iso6391': iso6391,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'offical': offical,
      'publichedAt': publichedAt,
      'id': id,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      iso31661: map['iso31661'],
      iso6391: map['iso6391'] ,
      key: map['key'] ,
      site: map['site'],
      size: map['size'] ,
      type: map['type'],
      offical: map['offical'],
      publichedAt:
          map['publichedAt'] ,
      id: map['id'] ,
    );
  }
}
