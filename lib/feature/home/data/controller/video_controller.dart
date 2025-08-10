import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  late YoutubePlayerController youtubeController;

  @override
  void onInit() {
    super.onInit();
    youtubeController = YoutubePlayerController(
      initialVideoId: 'dQw4w9WgXcQ', // Replace with actual video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void onClose() {
    youtubeController.dispose();
    super.onClose();
  }
}


/*
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  final Map<int, YoutubePlayerController> _videoControllers = {};

  YoutubePlayerController? getController(int index) {
    return _videoControllers[index];
  }

  void initializeController(int index, String videoId) {
    if (!_videoControllers.containsKey(index)) {
      _videoControllers[index] =
          YoutubePlayerController(
            initialVideoId: videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
              enableCaption: false,
            ),
          )..addListener(() {
            if (_videoControllers[index]!.value.isReady &&
                !_videoControllers[index]!.value.hasError) {
              update();
            }
          });
    }
  }

  @override
  void onClose() {
    _videoControllers.forEach((index, controller) {
      controller.dispose();
    });
    _videoControllers.clear();
    super.onClose();
  }
}
*/
