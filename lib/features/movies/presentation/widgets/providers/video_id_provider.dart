import 'package:flutter/material.dart';

class MovieVideoIdProvider extends ChangeNotifier {
  String _videoId = '';
  String get videoId => _videoId;
  set videoId(value) {
    _videoId = value;
    notifyListeners();
  }

  // late YoutubePlayerController _videoController;
//   get videoController => _videoController;
//   set videoController(YoutubePlayerController ){
// _videoController= YoutubePlayerController(
//         initialVideoId: value,
//         flags: const YoutubePlayerFlags(autoPlay: true));
//     notifyListeners();
//   }

}
