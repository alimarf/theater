import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/widget/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future setLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future setAllOrientations() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoPlayerWidget(controller: controller),
      ],
    );
  }
}
