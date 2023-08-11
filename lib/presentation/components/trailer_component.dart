part of 'components.dart';

class TrailerComponent extends StatefulWidget {
  const TrailerComponent({super.key});

  @override
  _TrailerComponentState createState() => _TrailerComponentState();
}

class _TrailerComponentState extends State<TrailerComponent> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorThemes.grey,
        title: const Text('TH3TR'),
      ),
      backgroundColor: ColorThemes.lightGrey,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        
        foregroundColor: ColorThemes.white,
        backgroundColor: Colors.transparent,
        
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
         size: 50.0,
          _controller.value.isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
