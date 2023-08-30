
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AdvancedOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onClickedFullscreen;

  static const allSpeeds = <double>[0.25, 0.5, 1, 1.5, 2, 3, 5, 10];

  const AdvancedOverlayWidget(
      {super.key, required this.controller, required this.onClickedFullscreen}); 

  String getPosition() {
    final duration = Duration(
        milliseconds: controller.value.position.inMilliseconds.round());

    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          controller.value.isPlaying ? controller.pause() : controller.play(),
      child: Stack(
        children: <Widget>[
          buildPlay(),
          buildSpeed(),
          Positioned(
            left: 8,
            bottom: 28,
            child: Text(getPosition()),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  Expanded(child: buildIndicator()),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: onClickedFullscreen,
                    child: const Icon(
                      Icons.fullscreen,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isMuted ? Icons.volume_mute : Icons.volume_up,
                      color: Colors.white,
                    ),
                    onPressed: () => controller.setVolume(isMuted ? 1 : 0),
                  ),
                  const SizedBox(width: 8),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildIndicator() => Container(
        margin: const EdgeInsets.all(8).copyWith(right: 0),
        height: 16,
        child: VideoProgressIndicator(
          controller,
          allowScrubbing: true,
        ),
      );

  Widget buildSpeed() => Align(
        alignment: Alignment.topRight,
        child: PopupMenuButton<double>(
          initialValue: controller.value.playbackSpeed,
          tooltip: 'Playback speed',
          onSelected: controller.setPlaybackSpeed,
          itemBuilder: (context) => allSpeeds
              .map<PopupMenuEntry<double>>((speed) => PopupMenuItem(
                    value: speed,
                    child: Text('${speed}x'),
                  ))
              .toList(),
          child: Container(
            color: Colors.white38,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Text('${controller.value.playbackSpeed}x'),
          ),
        ),
      );

  Widget buildPlay() => AnimatedSwitcher(
        duration: const Duration(milliseconds: 50),
        reverseDuration: const Duration(milliseconds: 200),
        child: controller.value.isPlaying
            ? Container()
            : Container(
                color: Colors.black26,
                child: const Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              ),
      );
}