// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieVideosEntities {
  int? id;
  List<VideoEntities?>? mVideoEntities;
  MovieVideosEntities({
    required this.id,
    required this.mVideoEntities,
  });
}

class VideoEntities {
  String? iso31661;
  String? iso6391;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? offical;
  String? publichedAt;
  String? id;
  VideoEntities({
    required this.iso31661,
    required this.iso6391,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.offical,
    required this.publichedAt,
    required this.id,
  });
}
